require 'spec_helper'

describe Sermonaudio::Sermon do
  
  let(:sermons) { Sermonaudio::Sermon.new }

  it "should create a Savon client instance" do
  	sermons.savon.should be_a(Savon::Client)
  end
  it "should have a client with the right WDSL" do
  	sermons.savon.wsdl.document.should eq("http://web4.sa-media.com/SASoapAPI/service.asmx?WSDL")
  end
  it "should find newest sermons by SpeakerName" do
  	result = sermons.find :newest, "SpeakerName" => "Lyle Batey"
  	result.should be_a Savon::SOAP::Response
  end

end