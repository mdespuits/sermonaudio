$:.push File.expand_path("../../lib", __FILE__)

# Everything depends on the Savon gem. Require it right away.
require "savon"

require "sermonaudio/version"
require "sermonaudio/configuration"
require "sermonaudio/client"
require "sermonaudio/savon"

module Sermonaudio; end