module SermonAudio
  class Finder
    def self.client
      @client ||= SermonAudio::Sermon.new.savon
    end

    def self.request(request_name, opts = {})
      client.call request_name, message: opts
    end

    def self.newest(opts = {})
      # response = request(call, opts)
      # puts response.inspect
    end

    def self.sermons(opts = {})
      # response = request(call, opts)
      # puts response.inspect
    end

    def self.series(opts = {})
      # response = request(call, opts)
      # puts response.inspect
    end

    def self.speakers(opts = {})
      # response = request(call, opts)
      # puts response.inspect
    end
  end
end
