module SermonAudio
  module Configuration
    class MissingConfiguration < StandardError; end

    attr_writer :member_id, :password, :api_key

    # Returns the specified SermonAudio.com Member ID.
    #
    # This can be defined explicitly via the writer method.
    # If it is not specified, it will return the value from
    # the `SERMONAUDIO_API_KEY` environment variable.
    #
    # Example:
    #
    #   SermonAudio.api_key
    #   # => SermonAudio::Configuration::MissingConfiguration
    #   ENV['SERMONAUDIO_API_KEY'] = 'example'
    #   # => 'example'
    #   SermonAudio.api_key
    #   # => 'example'
    #   SermonAudio.api_key = 'other'
    #   # => 'other'
    #   SermonAudio.api_key
    #   # => 'other'
    def api_key
      defined_or_env :api_key
    end

    # Returns the specified SermonAudio.com Member ID.
    #
    # This can be defined explicitly via the writer method.
    # If it is not specified, it will return the value from
    # the `SERMONAUDIO_MEMBER_ID` environment variable.
    #
    # Example:
    #
    #   SermonAudio.member_id
    #   # => SermonAudio::Configuration::MissingConfiguration
    #   ENV['SERMONAUDIO_MEMBER_ID'] = 'example'
    #   # => 'example'
    #   SermonAudio.member_id
    #   # => 'example'
    #   SermonAudio.member_id = 'other'
    #   # => 'other'
    #   SermonAudio.member_id
    #   # => 'other'
    def member_id
      defined_or_env :member_id
    end

    # Returns the specified SermonAudio.com password.
    #
    # This can be defined explicitly via the writer method.
    # If it is not specified, it will return the value from
    # the `SERMONAUDIO_PASSWORD` environment variable.
    #
    # Example:
    #
    #   SermonAudio.password
    #   # => SermonAudio::Configuration::MissingConfiguration
    #   ENV['SERMONAUDIO_PASSWORD'] = 'example'
    #   # => 'example'
    #   SermonAudio.password
    #   # => 'example'
    #   SermonAudio.password = 'other'
    #   # => 'other'
    #   SermonAudio.password
    #   # => 'other'
    def password
      defined_or_env :password
    end

    private

    def defined_or_env(value)
      instance_variable_get("@#{value}") || environment_value(value)
    end

    def environment_value(name)
      ENV.fetch("SERMONAUDIO_#{name.upcase}") do
        message = (<<-MSG).gsub(/\s+/, ' ')
        You must define a configuration.#{name}=(:value) or
        set environment 'SERMONAUDIO_#{name.upcase}'.
        MSG
        fail MissingConfiguration, message
      end
    end
  end
end
