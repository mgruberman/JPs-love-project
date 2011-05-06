# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sluggable}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Patrick Reagan"]
  s.date = %q{2009-09-29}
  s.email = %q{reaganpr@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = %q{http://sneaq.net}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{This gem provides an easy way to create slugs for your ActiveRecord models}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.1.1"])
      s.add_runtime_dependency(%q<activerecord>, [">= 2.1.1"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.1.1"])
      s.add_dependency(%q<activerecord>, [">= 2.1.1"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.1.1"])
    s.add_dependency(%q<activerecord>, [">= 2.1.1"])
  end
end
