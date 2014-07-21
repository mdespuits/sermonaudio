require 'spec_helper'

describe SermonAudio do

  describe '#client' do
    it "should be a method" do
      expect(SermonAudio).to respond_to :client
    end

    it "should return a Savon::Client" do
      expect(SermonAudio.client).to be_a Savon::Client
    end
  end

end
