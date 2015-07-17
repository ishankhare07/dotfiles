module Skylight
  class Trace
    GC_CAT = 'noise.gc'.freeze

    include Util::Logging

    attr_reader :endpoint, :notifications

    def self.new(instrumenter, endpoint, start, cat, title = nil, desc = nil, annot = nil)
      inst = native_new(normalize_time(start), "TODO", endpoint)
      inst.send(:initialize, instrumenter, cat, title, desc, annot)
      inst.endpoint = endpoint
      inst
    end

    # TODO: Move this into native
    def self.normalize_time(time)
      # At least one customer has extensions that cause integer division to produce rationals.
      # Since the native code expects an integer, we force it again.
      (time.to_i / 100_000).to_i
    end

    def initialize(instrumenter, cat, title, desc, annot)
      raise ArgumentError, 'instrumenter is required' unless instrumenter

      @instrumenter = instrumenter
      @submitted = false
      @broken = false

      @notifications = []

      if Hash === title
        annot = title
        title = desc = nil
      elsif Hash === desc
        annot = desc
        desc = nil
      end

      # create the root node
      @root = native_start_span(native_get_started_at, cat)
      native_span_set_title(@root, title) if title
      native_span_set_description(@root, desc) if desc

      @gc = config.gc.track unless ENV.key?("SKYLIGHT_DISABLE_GC_TRACKING")
    end

    def endpoint=(value)
      @endpoint = value
      native_set_endpoint(value)
      value
    end

    def config
      @instrumenter.config
    end

    def record(cat, title=nil, desc=nil, annot=nil)
      @return if @broken

      if Hash === title
        annot = title
        title = desc = nil
      elsif Hash === desc
        annot = desc
        desc = nil
      end

      title.freeze if title.is_a?(String)
      desc.freeze  if desc.is_a?(String)

      desc = @instrumenter.limited_description(desc)

      time = Util::Clock.nanos - gc_time

      stop(start(time, cat, title, desc), time)

      nil
    rescue => e
      error "failed to record span; msg=%s", e.message
      @broken = true
      nil
    end

    def instrument(cat, title=nil, desc=nil, annot=nil)
      return if @broken
      t { "instrument: #{cat}, #{title}" }

      if Hash === title
        annot = title
        title = desc = nil
      elsif Hash === desc
        annot = desc
        desc = nil
      end

      title.freeze if title.is_a?(String)
      desc.freeze  if desc.is_a?(String)

      original_desc = desc
      now           = Util::Clock.nanos
      desc          = @instrumenter.limited_description(desc)

      if desc == Instrumenter::TOO_MANY_UNIQUES
        debug "[SKYLIGHT] [#{Skylight::VERSION}] A payload description produced <too many uniques>"
        debug "original desc=%s", original_desc
        debug "cat=%s, title=%s, desc=%s, annot=%s", cat, title, desc, annot.inspect
      end

      start(now - gc_time, cat, title, desc, annot)
    rescue => e
      error "failed to instrument span; msg=%s", e.message
      @broken = true
      nil
    end

    def done(span)
      return unless span
      return if @broken
      stop(span, Util::Clock.nanos - gc_time)
    rescue => e
      error "failed to close span; msg=%s", e.message
      @broken = true
      nil
    end

    def release
      return unless @instrumenter.current_trace == self
      @instrumenter.current_trace = nil
    end

    def traced
      time = gc_time
      now = Util::Clock.nanos

      if time > 0
        t { fmt "tracking GC time; duration=%d", time }
        stop(start(now - time, GC_CAT, nil, nil, {}), now)
      end

      stop(@root, now)
    end

    def submit
      return if @broken

      t { "submitting trace" }

      if @submitted
        t { "already submitted" }
        return
      end

      release
      @submitted = true

      traced

      @instrumenter.process(self)
    rescue Exception => e
      error e
      t { e.backtrace.join("\n") }
    end

  private

    def start(time, cat, title, desc, annot=nil)
      span(self.class.normalize_time(time), cat, title, desc, annot)
    end

    def stop(span, time)
      native_stop_span(span, self.class.normalize_time(time))
      nil
    end

    def span(time, cat, title=nil, desc=nil, annot=nil)
      sp = native_start_span(time, cat.to_s)
      native_span_set_title(sp, title.to_s) if title
      native_span_set_description(sp, desc.to_s) if desc
      sp
    end

    def gc_time
      return 0 unless @gc
      @gc.update
      @gc.time
    end
  end
end
