module SermonAudio
  class Utils
    def self.array_wrap(obj)
      obj.is_a?(Hash) ? [obj] : Array(obj)
    end
  end
end
