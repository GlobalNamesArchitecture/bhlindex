# frozen_string_literal: true

require 'rubygems'
require 'bundler'
require 'bundler/gem_tasks'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  warn e.message
  warn 'Run `bundle install` to install missing gems'
  exit e.status_code
end
require 'rake'

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :grpc do
  cmd = 'grpc_tools_ruby_protoc ' \
    '-I $GOPATH/src/github.com/gnames/bhlindex/protob ' \
        '--ruby_out=lib --grpc_out=lib ' \
        '$GOPATH/src/github.com/gnames/bhlindex/protob/protob.proto'
  puts cmd
  `#{cmd}`
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--auto-correct']
end

task default: %i[rubocop grpc spec]
