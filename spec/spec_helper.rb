require 'bundler/setup'

require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'pry' unless ENV["TRAVIS"]
require 'vcr'

require 'sermonaudio'

def env(environment = {}, &blk)
  old = ->(key) { "__old_#{key}" }
  environment.each_pair do |key, value|
    ENV[old.(key)] = ENV[key] if ENV[key]
    ENV[key] = value
  end
  yield
ensure
  environment.each_pair do |key, value|
    if ENV[old.(key)]
      ENV.delete key
      ENV[key] = ENV[old.(key)]
      ENV.delete old.(key)
    else
      ENV.delete key
    end
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock # or :fakeweb
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<SA_PASSWORD>') { ENV["SERMONAUDIO_PASSWORD"] }
end

RSpec.configure do |config|
  # some (optional) config here
  config.mock_framework = :rspec
end
