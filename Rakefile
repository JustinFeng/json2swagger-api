require 'rspec/core/rake_task'

task default: :specs

desc 'Run all specs'
RSpec::Core::RakeTask.new(:specs) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['--color --format d']
end
