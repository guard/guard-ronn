# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'guard/ronn/version'

Gem::Specification.new do |s|
  s.name        = 'guard-ronn'
  s.version     = Guard::RonnVersion::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Rémy Coutable']
  s.email       = ['rymai@rymai.me']
  s.homepage    = 'http://rubygems.org/gems/guard-ronn'
  s.summary     = 'Guard gem for Ronn.'
  s.description = 'Guard::Ronn automatically builds manuals.'

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'guard-ronn'

  s.add_dependency 'guard', '>= 0.2.2'
  s.add_dependency 'ronn',  '~> 0.7.3'

  s.add_development_dependency 'bundler', '~> 1.0'
  s.add_development_dependency 'rspec',   '~> 2.5'

  s.files        = Dir.glob('{lib}/**/*') + %w[CHANGELOG.md LICENSE README.md]
  s.require_path = 'lib'
end
