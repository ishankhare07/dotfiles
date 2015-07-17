# -*- encoding: utf-8 -*-
# stub: skylight 0.6.0 ruby lib
# stub: ext/extconf.rb

Gem::Specification.new do |s|
  s.name = "skylight"
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Tilde, Inc."]
  s.date = "2015-01-27"
  s.email = ["engineering@tilde.io"]
  s.executables = ["skylight"]
  s.extensions = ["ext/extconf.rb"]
  s.files = ["bin/skylight", "ext/extconf.rb"]
  s.homepage = "http://www.skylight.io"
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubygems_version = "2.4.8"
  s.summary = "Skylight is a smart profiler for Rails apps"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.0.0"])
  end
end
