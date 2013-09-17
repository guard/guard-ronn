# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'guard/ronn/version'

Gem::Specification.new do |s|
  s.name        = 'guard-ronn'
  s.version     = Guard::RonnVersion::VERSION
  s.license     = 'MIT'
  s.authors     = ['Rémy Coutable']
  s.email       = ['remy@rymai.me']
  s.homepage    = 'http://rubygems.org/gems/guard-ronn'
  s.summary     = 'Guard plugin for Ronn.'
  s.description = 'Guard::Ronn automatically builds your manual pages.'

  s.add_runtime_dependency 'guard', '2.0.0.pre.2'
  s.add_runtime_dependency 'ronn',  '~> 0.7'

  s.add_development_dependency 'bundler'

  s.files        = Dir.glob('{lib}/**/*') + %w[CHANGELOG.md LICENSE README.md]
  s.require_path = 'lib'
end
