module SermonAudio
  # Actions that the SermonAudio module can call to
  # retrieve data from sermonaudio.com
  module Actions
    def get_sermon_info(sermon_id)
      execute_call(__callee__,
                   'MemberID' => ENV['SERMONAUDIO_MEMBER_ID'],
                   'Password' => ENV['SERMONAUDIO_PASSWORD'],
                   'SermonID' => sermon_id
      )
    end

    def get_series_by_member_id(member_id)
      response = execute_call(__callee__, 'MemberID' => member_id)
      response[:string] || []
    end

    def get_speakers_by_member_id(member_id)
      response = execute_call(__callee__,  'MemberID' => member_id)
      response[:string] || []
    end

    def get_event_types
      response = execute_call(__callee__)
      response[:string] || []
    end

    def get_speakers_by_keyword(word)
      response = execute_call(__callee__, 'Keyword' => word)
      response[:string] || []
    end

    private

    def execute_call(name, opts = {})
      response = SermonAudio.client.call(name, message: opts)
      response.body[:"#{name}_response"][:"#{name}_result"]
    end
  end
end
