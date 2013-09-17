# encoding: utf-8
Kernel.load File.expand_path('../lib/guard/ronn/version.rb', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'guard-ronn'
  s.version     = Guard::RonnVersion::VERSION
  s.license     = 'MIT'
  s.authors     = ['Rémy Coutable']
  s.email       = ['remy@rymai.me']
  s.homepage    = 'http://rubygems.org/gems/guard-ronn'
  s.summary     = 'Guard gem for Ronn.'
  s.description = 'Guard::Ronn automatically builds manual pages.'

  s.add_runtime_dependency 'guard', '>= 1.8'
  s.add_runtime_dependency 'ronn',  '~> 0.7'

  s.add_development_dependency 'bundler'

  s.files        = Dir.glob('{lib}/**/*') + %w[CHANGELOG.md LICENSE README.md]
  s.require_path = 'lib'
end
