module SermonAudio
  class Finder
    def self.client
      @client ||= SermonAudio::Sermon.new.savon
    end

    def self.request(request_name, opts = {})
      client.call request_name, message: opts
    end

    def self.newest(_opts = {})
      # response = request(call, opts)
      # puts response.inspect
    end

    def self.sermons(_opts = {})
      # response = request(call, opts)
      # puts response.inspect
    end

    def self.series(_opts = {})
      # response = request(call, opts)
      # puts response.inspect
    end

    def self.speakers(_opts = {})
      # response = request(call, opts)
      # puts response.inspect
    end
  end
end
