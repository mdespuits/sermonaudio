module SermonAudio
  # Operations that the SermonAudio module can call to
  # retrieve data from sermonaudio.com
  module Operations

    def get_sermon_info(sermon_id)
      SermonAudio.client.call(:get_sermon_info, message: {
        "MemberID" => ENV["SERMONAUDIO_MEMBER_ID"],
        "Password" => ENV["SERMONAUDIO_PASSWORD"],
        "SermonID" => sermon_id,
      }).body[:get_sermon_info_response][:get_sermon_info_result]
    end

  end
end
