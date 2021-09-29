# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'

desc 'Run unit tests'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

require 'rubocop/rake_task'

RuboCop::RakeTask.new

task default: %i[test rubocop]
