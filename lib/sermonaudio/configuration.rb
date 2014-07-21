module Sermonaudio
  class Configuration

    # Have a member_id and password been supplied
    def self.login_provided?
      @member_id && @password
    end

    def self.set(&block)
      instance_eval &block
    end

    def self.member_id
      raise MissingConfiguration, 'You are missing your Member ID.' unless @member_id
      @member_id
    end

    def self.member_id=(name)
      @member_id = name
    end

    def self.password
      raise MissingConfiguration, 'You are missing your Password.' unless @password
      @password
    end

    def self.password=(password)
      @password = password
    end

  end
end
