module SermonAudio
  class Configuration
    attr_writer :member_id, :password

    def member_id
      @member_id || ENV.fetch('SERMONAUDIO_MEMBER_ID')
    end

    def password
      @password || ENV.fetch('SERMONAUDIO_PASSWORD')
    end
  end
end
