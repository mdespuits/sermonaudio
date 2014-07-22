module SermonAudio
  class Configuration
    # Have a member_id and password been supplied
    def self.login_provided?
      @member_id && @password
    end

    class << self
      attr_writer :member_id, :password
    end

    def self.set(&block)
      instance_eval &block
    end

    def self.member_id
      unless @member_id
        fail MissingConfiguration, 'You must set your SermonAudio MemberID'
      end
      @member_id
    end

    def self.password
      unless @password
        fail MissingConfiguration, 'Please provide your SermonAudio password.'
      end
      @password
    end
  end
end
