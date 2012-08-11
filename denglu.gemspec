# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'denglu/version'

Gem::Specification.new do |gem|
  gem.name         = 'denglu'
  gem.version      = Denglu::VERSION
  gem.authors      = ['Spring MC']
  gem.email        = ['Heresy.Mc@gmail.com']
  gem.homepage     = 'http://github.com/mcspring/denglu'
  gem.summary      = 'Denglu open API wrapper of ruby language'
  gem.description  = 'NONE OFFICIAL'

  gem.rubyforge_project  = 'denglu'

  gem.files          = `git ls-files`.split($\)
  gem.test_files     = gem.files.grep(%r{^(spec,test,features)/})
  gem.executables    = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.require_paths  = ['lib']

  gem.add_dependency  'json'
  gem.add_dependency  'rest-client'

  gem.add_development_dependency  'rspec'
end
