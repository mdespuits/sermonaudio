require 'sermonaudio/configuration'

module SermonAudio
  # Actions that the SermonAudio module can call to
  # retrieve data from sermonaudio.com
  module Actions
    def convert_sermon_hash(data)
      data.each_with_object({}) do |(key, value), memo|
        memo[convert_key(key)] = value
      end
    end

    def convert_key(key)
      return key if key.is_a? String
      key.to_s.split('_')
         .map { |v| v.downcase == 'id' ? v.upcase : v.capitalize }
         .join
    end

    def submit_sermon(info)
      execute_call(__callee__, info)
    end

    def update_sermon(info)
      execute_call(__callee__, info)
    end

    def get_sermon_info(sermon_id)
      execute_call(__callee__,
                   'MemberID' => SermonAudio.member_id,
                   'Password' => SermonAudio.password,
                   'SermonID' => sermon_id
      )
    end

    def favorite_sermons
      get_favorite(__callee__, within: :sermon)
    end

    def favorite_speakers
      get_favorite(__callee__, within: :speaker)
    end

    def favorite_broadcasters
      get_favorite(__callee__, within: :member)
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

    def execute_call(name, message = {})
      response = SermonAudio.client.call(name, message: message)
      response.body[:"#{name}_response"][:"#{name}_result"]
    end

    def array_wrap(obj)
      obj.is_a?(Hash) ? [obj] : Array(obj)
    end

    def get_favorite(action, opts = {})
      response = execute_call(action,
                              'MemberID' => SermonAudio.member_id,
                              'Password' => SermonAudio.password
                 )
      array_wrap(response[opts.fetch(:within)]).compact
    end
  end
end
