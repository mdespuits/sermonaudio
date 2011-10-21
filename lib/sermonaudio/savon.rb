module Sermonaudio
  class Savon
    
    def initialize
      @savon ||= Sermonaudio::Client.client
    end
    
    def self.recent_sermons_by(name)
      Client.client.request :ser, :newest_sermons_by_speaker, body: { "SpeakerName" => name }
    end
    
    def find(method, *args)
      # make calls to the right method based on the method and the arguments
    end
    
    def get(method, *args)
      # invoke the find method if user login configuration is provided
    end
    
    def upload
      # upload a sermon with the given files
    end
    
  end
end