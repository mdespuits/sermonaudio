require 'sermonaudio/savon'

module Sermonaudio
	class Finder

    @@client ||= Sermonaudio::Sermon.new.savon

    def self.request(request_name, opts = {})
      request = @@client.request :ser, request_name, body: opts
    end

    def self.newest(opts = {})
      call = :newest_sermons_by_speaker if opts.has_key? "SpeakerName"
      call = :newest_sermons_by_member_id if opts.has_key? "MemberID"
      if opts.has_key? :what && opts[:what] == "series"
        raise MissingOption, "Please provid a member id when searching for a series" unless opts.has_kay? "MemberID"
        call = :get_newest_series_by_member_id 
      end
      response = self.request(call, opts)
      puts response.inspect
    end

    def self.sermons(opts = {})
      # response = self.request(call, opts)
      # puts response.inspect
    end

    def self.series(opts = {})
      # response = self.request(call, opts)
      # puts response.inspect
    end

    def self.speakers(opts = {})
      # response = self.request(call, opts)
      # puts response.inspect
    end

	end
end