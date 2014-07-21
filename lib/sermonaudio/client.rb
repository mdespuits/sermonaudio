module Sermonaudio
  ## Require Savon library
  include Savon

  module Client

    WSDL_ENDPOINT = 'http://web4.sa-media.com/SASoapAPI/service.asmx?WSDL'

    extend self

    ## Setup the client
    def client
      @sermonaudio_savon_client ||= Savon::Client.new WSDL_ENDPOINT
    end

  end
end
