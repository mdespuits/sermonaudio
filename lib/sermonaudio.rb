$:.push File.expand_path("../../lib", __FILE__)
require "sermonaudio/version"     # Always require version
require "savon"                   # Everything depends on the Savon gem. Require it right away.

## Set base configuration
Savon.configure do |config|
  config.log = false            # disable logging
  config.log_level = :error     # changing the log level
  config.logger = false
  config.raise_errors = false   # do not raise SOAP faults and HTTP errors
  config.soap_version = 2       # use SOAP 1.2
end

require "sermonaudio/exceptions"    # For exceptions

# Load Sermonaudio specific files
require "sermonaudio/configuration"
require "sermonaudio/client"
require "sermonaudio/sermon"
require "sermonaudio/finder"
