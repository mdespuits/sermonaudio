require 'sermonaudio/savon'

module Sermonaudio
	class Finder

    @@client ||= Sermonaudio::Savon.new.savon
    
# reference
# Client.client.request :ser, :newest_sermons_by_speaker, body: { "SpeakerName" => name }

    def self.request(request_name, opts = {})
      request = @@client.request :ser, request_name, body: opts
    end

    def self.newest(opts = {})
      call = :newest_sermons_by_speaker if opts.has_key? "SpeakerName"
      call = :newest_sermons_by_member_id if opts.has_key? "MemberID"
      call = :get_newest_series_by_member_id if opts.has_key? :what && opts[:what] == "series"
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