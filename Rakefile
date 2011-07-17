# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "maybeyoumeant"
  gem.homepage = "http://github.com/liehann/maybeyoumeant"
  gem.license = "MIT"
  gem.summary = "IRB plugin that suggests corrections for misspelled method names."
  gem.description = %Q{
  If you misspell a method in IRB this plugin searches through methods
  defined on the object and calls the closest method to the one you entered.
  For example lets say you typed:
   'hello world'.capitalze
  Instead of raising a NoMethodError 'hello world'.capitalize would automatically
  be called.
  }
  gem.email = "liehannl@gmail.com"
  gem.authors = ["Liehann Loots"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new do |test|
  test.libs << 'lib' << 'spec/lib'
  # test.verbose = true
  test.pattern = 'spec/**/*_spec.rb'
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.rcov_opts << '--exclude "gems/*"'
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "maybeyoumeant #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

