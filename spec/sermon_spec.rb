require 'spec_helper'

describe Sermonaudio::Sermon do
  
  let(:sermon) { Sermonaudio::Sermon.new }

  it "should create a Savon client instance" do
  	sermon.savon.should be_a(Savon::Client)
  end
  it "should have a client with the right WDSL" do
  	sermon.savon.wsdl.document.should eq("http://web4.sa-media.com/SASoapAPI/service.asmx?WSDL")
  end
  

end