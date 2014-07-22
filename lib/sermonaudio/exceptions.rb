module SermonAudio
  # Extend the default StandardError class for a general error
  class Error < StandardError; end

  # Raised when necessary option is not provided
  class MissingOption < Error; end

  # Raised when necessary configuration is missing.
  # (Usually for missing login information)
  class MissingConfiguration < Error; end
end
