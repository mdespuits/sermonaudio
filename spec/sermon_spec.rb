require 'spec_helper'

describe SermonAudio::Sermon do

  let(:sermons) { SermonAudio::Sermon.new }

  it "should create a Savon client instance" do
    expect(sermons.savon).to be_a(Savon::Client)
  end

  it "should have a client with the right WDSL" do
    expect(sermons.savon.globals[:wsdl]).to eq("http://web4.sa-media.com/SASoapAPI/service.asmx?WSDL")
  end

  describe "#find" do

    it "should delegate arguments to Finder" do
      sermon = SermonAudio::Sermon.new
      [:sermons, :speakers, :series, :newest].each do |arg|
        expect(SermonAudio::Finder).to receive(arg).with({})
        sermon.find(arg, {})
      end
    end

    context "success" do
      xit "should find newest sermons by SpeakerName", vcr: true do
        result = sermons.find :newest, "SpeakerName" => "Mitchell Jones"
        expect(result).to be_a Savon::Response
      end
    end

    context "failure" do
      xit "should raise an error if no arguments are passed", vcr: true do
        expect { sermons.find(:newest) }.to raise_error(SermonAudio::MissingOption)
      end

      xit "should raise an error if invalid arguments are passed", vcr: true do
        expect {
          sermons.find(:newest, :what => "series")
        }.to raise_error(SermonAudio::MissingOption)
      end
    end
  end
end
