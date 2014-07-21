require 'rubygems'
require 'bundler/setup'

require 'sermonaudio' # and any other gems you need
require 'pry'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/cassettes'
  c.hook_into :webmock # or :fakeweb
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  # some (optional) config here
  config.mock_framework = :rspec
end
