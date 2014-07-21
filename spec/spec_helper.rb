require 'rubygems'
require 'bundler/setup'

require 'sermonaudio' # and any other gems you need
require 'pry'

RSpec.configure do |config|
  # some (optional) config here
  config.mock_framework = :rspec
end
