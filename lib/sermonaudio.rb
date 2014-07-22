$LOAD_PATH.push File.expand_path('../../lib', __FILE__)
require 'sermonaudio/version'     # Always require version
require 'savon'

require 'sermonaudio/exceptions'    # For exceptions

# Load SermonAudio specific files
require 'sermonaudio/configuration'
require 'sermonaudio/operations'
require 'sermonaudio/client'
require 'sermonaudio/sermon'
require 'sermonaudio/finder'

module SermonAudio
  extend Operations
end
