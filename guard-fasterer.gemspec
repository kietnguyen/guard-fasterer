# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/fasterer/version'

Gem::Specification.new do |s|
  s.name    = 'guard-fasterer'
  s.version = Guard::FastererVersion::VERSION
  s.authors = ['Matthias Döring']
  s.email   = ['matt@foryourcontent.de']

  s.summary     = 'Guard gem for fasterer'
  s.description = 'Guard gem for fasterer - automatically runs fasterer'

  s.homepage = 'https://github.com/matt-hh/guard-fasterer'
  s.license  = 'MIT'

  s.files         = Dir.glob('{lib}/**/*') + %w(LICENSE.txt README.md)
  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'guard', '>= 2.13.0'
  s.add_dependency 'guard-compat', '>= 1.2.1'
  s.add_dependency 'fasterer'

  s.add_development_dependency 'bundler', '~> 1.10'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec'
end
