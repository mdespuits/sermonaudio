module SermonAudio
  class Finder
    def self.client
      @client ||= SermonAudio::Sermon.new.savon
    end

    def self.request(request_name, opts = {})
      client.call request_name, message: opts
    end

    def self.newest(opts = {})
      if opts.empty?
        fail MissingOption, 'Provide valid parameters for newest entries'
      end
      call = :newest_sermons_by_speaker if opts.key? 'SpeakerName'
      call = :newest_sermons_by_member_id if opts.key? 'MemberID'
      if opts[:what] == 'series'
        unless opts.keys? 'MemberID'
          fail MissingOption, 'Provide a Member ID when searching for a series'
        end
        call = :get_newest_series_by_member_id
      end
      request(call, opts)
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
