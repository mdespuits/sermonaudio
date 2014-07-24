module SermonAudio
  module Configuration
    class MissingConfiguration < KeyError; end

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      attr_writer :member_id, :password

      def member_id
        defined_or_env :member_id
      end

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
end
