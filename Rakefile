require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task :console do
  require 'pry'
  require 'sermonaudio' # You know what to do.
  ARGV.clear
  Pry.start
end
