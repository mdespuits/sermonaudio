module SermonAudio
  class Configuration
    attr_writer :member_id, :password

    def member_id
      defined_or_env :member_id
    end

    def password
      defined_or_env :password
    end

    private

    class MissingConfiguration < StandardError; end

    def defined_or_env(value)
      instance_variable_get("@#{value}") || ENV.fetch("SERMONAUDIO_#{value.upcase}") do
        message = (<<-MSG).gsub(/\s+/, ' ')
        You must define a configuration.#{value}=(value) or
        set environment 'SERMONAUDIO_#{value.upcase}'.
        MSG
        raise MissingConfiguration, message
      end
    end
  end
end
