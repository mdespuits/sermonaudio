module Sermonaudio
  class Configuration
    
    def self.login_provided?
      @@member_id && @password
    end
    
    def self.set(&block)
      instance_eval &block
    end
    
    def self.member_id
      @@member_id
    rescue Exception => e
      puts e.message
    end
    
    def self.member_id=(name)
      @@member_id = name
    end
    
    def self.password
      @@password
    rescue Exception => e
      puts e.message
    end
    
    def self.password=(password)
      @@password = password
    end
    
  end
end
