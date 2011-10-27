$:.push File.expand_path("../../lib", __FILE__)
require "sermonaudio/version"     # Always require version
require "savon"                   # Everything depends on the Savon gem. Require it right away.
require "sermonaudio/exceptions"    # For exceptions

# Load Sermonaudio specific files
require "sermonaudio/configuration"
require "sermonaudio/client"
require "sermonaudio/finder"
require "sermonaudio/savon"

module Sermonaudio; end
