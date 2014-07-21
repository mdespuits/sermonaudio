require 'rubygems'
require 'bundler/setup'

require 'sermonaudio' # and any other gems you need
require 'pry'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock # or :fakeweb
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<SA_MEMBER_ID>') { ENV["SERMONAUDIO_MEMBER_ID"] }
  c.filter_sensitive_data('<SA_PASSWORD>') { ENV["SERMONAUDIO_PASSWORD"] }
end

RSpec.configure do |config|
  # some (optional) config here
  config.mock_framework = :rspec
end
