module Sermonaudio
  ## Require Savon library
  include Savon

  module Client

    extend self
    
    ## Set base configuration
    Savon.configure do |config|
      config.log = false            # disable logging
      config.log_level = :error     # changing the log level
      config.logger = false
      config.raise_errors = false   # do not raise SOAP faults and HTTP errors
      config.soap_version = 2       # use SOAP 1.2
    end
    
    ## Setup the client
    def client      
      @sermonaudio_savon_client ||= Savon::Client.new 'http://web4.sa-media.com/SASoapAPI/service.asmx?WSDL'
    end
    
  end
end