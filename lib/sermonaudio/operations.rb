module SermonAudio
  # Operations that the SermonAudio module can call to
  # retrieve data from sermonaudio.com
  module Operations
    def get_sermon_info(sermon_id)
      execute_call(__callee__, {
        'MemberID' => ENV['SERMONAUDIO_MEMBER_ID'],
        'Password' => ENV['SERMONAUDIO_PASSWORD'],
        'SermonID' => sermon_id
      })
    end

    def get_speakers_by_member_id(member_id)
      response = execute_call(__callee__, { "MemberID" => member_id })
      response[:string] || []
    end

    private

      def execute_call(operation, opts = {})
        response = SermonAudio.client.call(operation, message: opts)
        response.body["#{operation}_response".to_sym]["#{operation}_result".to_sym]
      end

  end
end
