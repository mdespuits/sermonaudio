require 'spec_helper'

module SermonAudio
  describe Configuration do
    it "should allow for member_id and password to be set" do
      expect(subject).to respond_to :member_id
      expect(subject).to respond_to :password
    end

    it "should default to environment variables if they are provided" do
      env("SERMONAUDIO_MEMBER_ID" => "example") do
        expect(subject.member_id).to eq "example"
      end

      env("SERMONAUDIO_PASSWORD" => "example") do
        expect(subject.password).to eq "example"
      end
    end

    it "should allow member_id and password to be explicitly set" do
      subject.member_id = "other_id"
      subject.password = "other_password"

      env("SERMONAUDIO_MEMBER_ID" => "example", "SERMONAUDIO_PASSWORD" => "p") do
        expect(subject.member_id).to eq "other_id"
        expect(subject.password).to eq "other_password"
      end
    end

    it "should raise and error if no values are set" do
      env("SERMONAUDIO_MEMBER_ID" => nil, "SERMONAUDIO_PASSWORD" => nil) do
        expect { subject.member_id }.to raise_error Configuration::MissingConfiguration
        expect { subject.password }.to raise_error Configuration::MissingConfiguration
      end
    end
  end
end
