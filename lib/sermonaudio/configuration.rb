module Sermonaudio
  class Configuration
    
    def initialize(&block)
      instance_eval &block
    end
    
    def self.memeber_id
      @@username
    end
    
    def self.memeber_id=(name)
      @@username = name
    end
    
    def self.password
      @@password
    end
    
    def self.password=(password)
      @@password = password
    end
    
  end
end
