# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'bhlindex/version'

Gem::Specification.new do |gem|
  gem.name = 'bhlindex'
  gem.homepage = 'http://github.com/GlobalNamesArchitecture/bhlindex'
  gem.version = Bhlindex::VERSION
  gem.authors = ['Dmitry Mozzherin']
  gem.license = 'MIT'
  gem.summary = 'Access to BHL data'
  gem.description = %(The gem is able to ingest streams of textual and metadata
  on a large scale from Biodiversity Heritage Library)
  gem.email = 'dmozzherin@gmail.com'

  gem.files         = `git ls-files -z`
                      .split("\x0")
                      .reject { |f| f.match(%r{^(test|spec|features)/}) }

  gem.require_paths = ['lib']
  gem.required_ruby_version = '~> 2.6'
  gem.add_development_dependency 'bundler', '~> 2.0'
  gem.add_development_dependency 'byebug', '~> 10.0'
  gem.add_development_dependency 'grpc', '~> 1.15'
  gem.add_development_dependency 'grpc-tools', '~> 1.15'
  gem.add_development_dependency 'rake', '~> 12.3'
  gem.add_development_dependency 'rspec', '~> 3.8'
  gem.add_development_dependency 'rubocop', '~> 0.59'
end
