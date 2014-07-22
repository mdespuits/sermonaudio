module SermonAudio
  class Sermon
    attr_accessor :savon

    def initialize
      @savon ||= SermonAudio.client
    end

    def find(method, args = {})
      Finder.send(method, args)
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
