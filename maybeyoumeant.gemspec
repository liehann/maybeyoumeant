# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{maybeyoumeant}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Liehann Loots"]
  s.date = %q{2011-07-18}
  s.description = %q{
  If you misspell a method in IRB this plugin searches through methods
  defined on the object and calls the closest method to the one you entered.
  For example lets say you typed:
   'hello world'.capitalze
  Instead of raising a NoMethodError 'hello world'.capitalize would automatically
  be called.
  }
  s.email = %q{liehannl@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/maybeyoumeant.rb",
    "lib/maybeyoumeant/config.rb",
    "lib/maybeyoumeant/levenshtein.rb",
    "lib/maybeyoumeant/matrix.rb",
    "lib/maybeyoumeant/nil_logger.rb",
    "lib/maybeyoumeant/object_extensions.rb",
    "lib/maybeyoumeant/std_err_logger.rb",
    "spec/.helper.rb.swo",
    "spec/helper.rb",
    "spec/lib/foo.rb",
    "spec/maybeyoumeant/.matrix_spec.rb.swo",
    "spec/maybeyoumeant/levenshtein_spec.rb",
    "spec/maybeyoumeant/matrix_spec.rb",
    "spec/maybeyoumeant/object_extensions_spec.rb"
  ]
  s.homepage = %q{http://github.com/liehann/maybeyoumeant}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{IRB plugin that suggests corrections for misspelled method names.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rainbow>, ["~> 1.1.1"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 1.3.2"])
    else
      s.add_dependency(%q<rainbow>, ["~> 1.1.1"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 1.3.2"])
    end
  else
    s.add_dependency(%q<rainbow>, ["~> 1.1.1"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 1.3.2"])
  end
end
