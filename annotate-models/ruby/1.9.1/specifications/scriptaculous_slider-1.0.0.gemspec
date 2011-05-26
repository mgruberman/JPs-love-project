# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{scriptaculous_slider}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nicolas Cavigneaux"]
  s.date = %q{2009-01-26}
  s.description = %q{This extension is of fork of the original scriptaculous slider plugin which is not maintained anymore. It provides helpers for the script.aculo.us slider control.}
  s.email = %q{nico@bounga.org}
  s.extra_rdoc_files = ["README"]
  s.files = ["README"]
  s.homepage = %q{http://www.bitbucket.org/Bounga/acts_as_nice_url}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{slider}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{A Ruby on Rails extension to provide provides helpers for the script.aculo.us slider control}

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, [">= 0"])
    else
      s.add_dependency(%q<actionpack>, [">= 0"])
    end
  else
    s.add_dependency(%q<actionpack>, [">= 0"])
  end
end
