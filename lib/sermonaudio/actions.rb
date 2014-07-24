require 'sermonaudio/configuration'

module SermonAudio
  # Actions that the SermonAudio module can call to
  # retrieve data from sermonaudio.com
  module Actions
    def get_sermon_info(sermon_id)
      config = Configuration.new
      execute_call(__callee__,
                   'MemberID' => config.member_id,
                   'Password' => config.password,
                   'SermonID' => sermon_id
      )
    end

    def favorite_sermons
      config = Configuration.new
      response = execute_call(__callee__,
                              'MemberID' => config.member_id,
                              'Password' => config.password
                 )
      array_wrap(response[:sermon]).compact
    end

    def get_series_by_member_id(member_id)
      response = execute_call(__callee__, 'MemberID' => member_id)
      response[:string] || []
    end

    def get_speakers_by_member_id(member_id)
      response = execute_call(__callee__,  'MemberID' => member_id)
      response[:string] || []
    end

    def get_newest_series_by_member_id(member_id)
      response = execute_call(__callee__, 'MemberID' => member_id)
      response[:string] || []
    end

    def newest_sermons_by_member_id(member_id)
      response = execute_call(__callee__, 'MemberID' => member_id)
      response[:sermon] || []
    end

    def newest_sermons_by_speaker(name)
      response = execute_call(__callee__, 'SpeakerName' => name)
      response[:sermon] || []
    end

    def get_event_types
      response = execute_call(__callee__)
      response[:string] || []
    end

    def get_languages
      response = execute_call(__callee__)
      response[:string] || []
    end

    def get_speakers_by_keyword(word)
      response = execute_call(__callee__, 'Keyword' => word)
      response[:string] || []
    end

    def sermon_list(member_id)
      response = execute_call(__callee__, 'MemberID' => member_id)
      response[:sermon] || []
    end

    private

    def execute_call(name, opts = {})
      response = SermonAudio.client.call(name, message: opts)
      response.body[:"#{name}_response"][:"#{name}_result"]
    end

    def array_wrap(obj)
      obj.is_a?(Hash) ? [obj] : Array(obj)
    end
  end
end
