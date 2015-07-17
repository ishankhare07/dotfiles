require 'thread'
require 'strscan'
require 'skylight/api'

module Skylight
  # @api private
  class Instrumenter
    KEY  = :__skylight_current_trace
    LOCK = Mutex.new
    DESC_LOCK = Mutex.new

    TOO_MANY_UNIQUES = "<too many unique descriptions>"

    include Util::Logging

    class TraceInfo
      def current
        Thread.current[KEY]
      end

      def current=(trace)
        Thread.current[KEY] = trace
      end
    end

    def self.instance
      @instance
    end

    # Do start
    # @param [Config] config The config
    def self.start!(config = nil)
      return @instance if @instance

      LOCK.synchronize do
        return @instance if @instance
        @instance = new(config).start!
      end
    rescue => e
      message = sprintf("[SKYLIGHT] [#{Skylight::VERSION}] Unable to start Instrumenter; msg=%s; class=%s", e.message, e.class)
      if config && config.respond_to?(:logger)
        config.logger.warn message
      else
        warn message
      end
      false
    end

    def self.stop!
      LOCK.synchronize do
        return unless @instance
        # This is only really helpful for getting specs to pass.
        @instance.current_trace = nil

        @instance.shutdown
        @instance = nil
      end
    end

    at_exit do
      if RUBY_VERSION == '1.9.2'
        # workaround for MRI bug losing exit status in at_exit block
        # http://bugs.ruby-lang.org/issues/5218
        exit_status = $!.status if $!.is_a?(SystemExit)
        stop!
        exit exit_status if exit_status
      else
        stop!
      end
    end

    attr_reader :config, :gc, :trace_info

    def self.new(config)
      config ||= {}
      config = Config.load(config) unless config.is_a?(Config)
      config.validate!

      inst = native_new(config.to_env)
      inst.send(:initialize, config)
      inst
    end

    def initialize(config)
      @gc = config.gc
      @config = config
      @subscriber = Subscriber.new(config, self)

      @trace_info = @config[:trace_info] || TraceInfo.new
      @descriptions = Hash.new { |h,k| h[k] = {} }
    end

    def current_trace
      @trace_info.current
    end

    def current_trace=(trace)
      @trace_info.current = trace
    end

    def start!
      # Warn if there was an error installing Skylight.
      # We do this here since we can't report these issues via Gem install without stopping install entirely.
      Skylight.check_install_errors(config)

      unless Skylight.native?
        Skylight.warn_skylight_native_missing(config)
        return
      end

      t { "starting instrumenter" }
      @config.validate!

      unless validate_authentication
        warn "invalid authentication token"
        return
      end

      t { "starting native instrumenter" }
      unless native_start
        warn "failed to start instrumenter"
        return
      end

      @config.gc.enable
      @subscriber.register!

      self

    rescue Exception => e
      log_error "failed to start instrumenter; msg=%s; config=%s", e.message, @config.inspect
      t { e.backtrace.join("\n") }
      nil
    end

    def shutdown
      @subscriber.unregister!
      native_stop
    end

    def trace(endpoint, cat, title=nil, desc=nil, annot=nil)
      # If a trace is already in progress, continue with that one
      if trace = @trace_info.current
        return yield(trace) if block_given?
        return trace
      end

      begin
        trace = Trace.new(self, endpoint, Util::Clock.nanos, cat, title, desc, annot)
      rescue Exception => e
        log_error e.message
        t { e.backtrace.join("\n") }
        return
      end

      @trace_info.current = trace
      return trace unless block_given?

      begin
        yield trace

      ensure
        @trace_info.current = nil
        t { "submitting trace" }
        trace.submit
      end
    end

    def disable
      @disabled = true
      yield
    ensure
      @disabled = false
    end

    def disabled?
      @disabled
    end

    @scanner = StringScanner.new('')
    def self.match?(string, regex)
      @scanner.string = string
      @scanner.match?(regex)
    end

    def match?(string, regex)
      self.class.match?(string, regex)
    end

    def done(span)
      return unless trace = @trace_info.current
      trace.done(span)
    end

    def instrument(cat, title=nil, desc=nil, annot=nil)
      raise ArgumentError, 'cat is required' unless cat

      unless trace = @trace_info.current
        return yield if block_given?
        return
      end

      cat = cat.to_s

      unless match?(cat, CATEGORY_REGEX)
        warn "invalid skylight instrumentation category; value=%s", cat
        return yield if block_given?
        return
      end

      cat = "other.#{cat}" unless match?(cat, TIER_REGEX)

      unless sp = trace.instrument(cat, title, desc, annot)
        return yield if block_given?
        return
      end

      return sp unless block_given?

      begin
        yield sp
      ensure
        trace.done(sp)
      end
    end

    def limited_description(description)
      endpoint = @trace_info.current.endpoint

      DESC_LOCK.synchronize do
        set = @descriptions[endpoint]

        if set.size >= 100
          return TOO_MANY_UNIQUES
        end

        set[description] = true
        description
      end
    end

    def process(trace)
      t { fmt "processing trace" }

      if ignore?(trace)
        t { fmt "ignoring trace" }
        return false
      end

      begin
        native_submit_trace(trace)
        true
      rescue => e
        warn "failed to submit trace to worker; err=%s", e
        false
      end
    end

    def ignore?(trace)
      @config.ignored_endpoints.include?(trace.endpoint)
    end

    # Validates that the provided authentication token is valid. This is done
    # by issuing a request for a session token and checking the response
    def validate_authentication
      # If a session token is specified, don't bother attempting to validate
      if config[:session_token]
        debug "using pre-generated session token"
        true
      else
        api = Api.new(config)
        api.authentication = config[:authentication]

        case res = api.validate_authentication
        when :ok
          true
        when :invalid
          false
        when :unknown
          warn "unable to validate authentication token"
          true
        else
          error "[BUG] unexpected validate_token result; res=%s", res
          true
        end
      end
    end

  end
end
