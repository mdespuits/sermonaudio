module SermonAudio
  class Sermon
    attr_accessor :savon

    def initialize
      @savon ||= SermonAudio.client
    end

    def find(method, args = {})
      # make calls to the right method based on the method and the arguments
      case
      when method == :sermons
        Finder.sermons(args)
      when method == :speakers
        Finder.speakers(args)
      when method == :series
        Finder.series(args)
      when method == :newest
        Finder.newest(args)
      end
    end

    def get(method, *args)
      # invoke the find method if user login configuration is provided
    end

    # This functionality will come later
    # def upload
    #   # upload a sermon with the given files
    # end
  end
end
