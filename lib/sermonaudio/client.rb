module SermonAudio
  module_function

  WSDL_ENDPOINT = 'http://web4.sa-media.com/SASoapAPI/service.asmx?WSDL'

  ## Setup the client
  def client
    Savon.client do
      wsdl WSDL_ENDPOINT
      soap_version 2
    end
  end
end
