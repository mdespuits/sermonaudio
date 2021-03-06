require 'bundler/setup'

require 'simplecov'
require 'coveralls'

formatters = [SimpleCov::Formatter::HTMLFormatter]

if ENV["TRAVIS"]
  formatters << Coveralls::SimpleCov::Formatter
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[*formatters]
SimpleCov.start do
  add_filter "/spec/"
end

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
  c.filter_sensitive_data('<SA_API_KEY>') { ENV["SERMONAUDIO_API_KEY"] }
end

RSpec.configure do |config|
  # some (optional) config here
  config.mock_with :rspec do |mocks|

    # This option should be set when all dependencies are being loaded
    # before a spec run, as is the case in a typical spec helper. It will
    # cause any verifying double instantiation for a class that does not
    # exist to raise, protecting against incorrectly spelt names.
    mocks.verify_doubled_constant_names = true

  end
  config.disable_monkey_patching!
  config.mock_framework = :rspec
end
