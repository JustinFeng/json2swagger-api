require 'rspec/core/rake_task'
require 'rubocop/rake_task'

task default: %i[rubocop specs]

RuboCop::RakeTask.new

desc 'Run all specs'
RSpec::Core::RakeTask.new(:specs) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['--color --format d']
end
