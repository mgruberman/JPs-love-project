# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{exception_notification}
  s.version = "2.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jamis Buck", "Josh Peek"]
  s.date = %q{2011-03-08}
  s.email = %q{smartinez87@gmail.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Exception notification by email for Rails apps}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
