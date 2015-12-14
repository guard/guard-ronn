# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/ronn/version'

Gem::Specification.new do |s|
  s.name        = 'guard-ronn'
  s.version     = Guard::RonnVersion::VERSION
  s.license     = 'MIT'
  s.author      = 'Rémy Coutable'
  s.email       = 'remy@rymai.me'
  s.homepage    = 'https://rubygems.org/gems/guard-ronn'
  s.summary     = 'Guard plugin for Ronn.'
  s.description = 'Guard::Ronn automatically builds your manual pages.'

  s.required_ruby_version = '>= 1.9.2'

  s.add_dependency 'guard', '~> 2.1'
  s.add_dependency 'guard-compat', '~> 1.1'
  s.add_dependency 'ronn',  '>= 0.7'

  s.add_development_dependency 'bundler'

  s.files        = Dir.glob('{lib}/**/*') + %w[CHANGELOG.md LICENSE README.md]
  s.require_path = 'lib'
end
