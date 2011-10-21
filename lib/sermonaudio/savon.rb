module Sermonaudio
  class Savon
    
    def self.recent_sermons_by(name)
      Client.client.request :ser, :newest_sermons_by_speaker, body: { "SpeakerName" => name }
    end
    
  end
end