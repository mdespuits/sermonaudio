# Load SermonAudio specific files
require 'sermonaudio/client'
require 'sermonaudio/configuration'
require 'sermonaudio/actions'

module SermonAudio
  extend Actions
  include Configuration
end
