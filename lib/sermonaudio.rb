$LOAD_PATH.push File.expand_path('../../lib', __FILE__)
require 'sermonaudio/version'     # Always require version
require 'savon'

# Load SermonAudio specific files
require 'sermonaudio/configuration'
require 'sermonaudio/actions'
require 'sermonaudio/client'

module SermonAudio
  extend Actions
  include Configuration
end
