# -*- encoding: utf-8 -*-
# stub: rapidfire 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rapidfire"
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Yuva Kumar"]
  s.date = "2015-02-19"
  s.description = "One stop solution for all survey related requirements! Its tad easy!."
  s.email = ["yuva@codemancers.com"]
  s.homepage = "https://github.com/code-mancers/rapidfire"
  s.post_install_message = "There is breaking delimiter change when upgrading to version 2.0.0.\nPlease see Readme for more information.\n"
  s.rubygems_version = "2.4.8"
  s.summary = "Surveys made easy."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.2.13"])
      s.add_runtime_dependency(%q<active_model_serializers>, ["~> 0.8.1"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<quiet_assets>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
      s.add_development_dependency(%q<factory_girl_rails>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<capybara-webkit>, [">= 0"])
      s.add_development_dependency(%q<launchy>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.2.13"])
      s.add_dependency(%q<active_model_serializers>, ["~> 0.8.1"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<quiet_assets>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
      s.add_dependency(%q<factory_girl_rails>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<capybara-webkit>, [">= 0"])
      s.add_dependency(%q<launchy>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.2.13"])
    s.add_dependency(%q<active_model_serializers>, ["~> 0.8.1"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<quiet_assets>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
    s.add_dependency(%q<factory_girl_rails>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<capybara-webkit>, [">= 0"])
    s.add_dependency(%q<launchy>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
  end
end
