require 'spec_helper'


module SermonAudio
  RSpec.describe Configuration do
    subject(:config) {
      Class.new do
        extend(Configuration)
      end
    }

    it "should allow for member_id and password to be set" do
      expect(config).to respond_to :member_id
      expect(config).to respond_to :password
      expect(config).to respond_to :api_key
    end

    it "should default to environment variables if they are provided" do
      env("SERMONAUDIO_MEMBER_ID" => "example") do
        expect(config.member_id).to eq "example"
      end

      env("SERMONAUDIO_PASSWORD" => "example") do
        expect(config.password).to eq "example"
      end

      env("SERMONAUDIO_API_KEY" => "example") do
        expect(config.api_key).to eq "example"
      end
    end

    it "should allow member_id and password to be explicitly set" do
      config.member_id = "other_id"
      config.password = "other_password"
      config.api_key = "default_key"

      env("SERMONAUDIO_MEMBER_ID" => "example",
          "SERMONAUDIO_PASSWORD" => "p",
          "SERMONAUDIO_API_KEY" => "other_key",
         ) do
        expect(config.member_id).to eq "other_id"
        expect(config.password).to eq "other_password"
        expect(config.api_key).to eq "default_key"
      end
    end

    it "should raise and error if no values are set" do
      env("SERMONAUDIO_MEMBER_ID" => nil,
          "SERMONAUDIO_PASSWORD" => nil,
          "SERMONAUDIO_API_KEY" => nil,
         ) do
        expect { config.member_id }.to raise_error Configuration::MissingConfiguration, /configuration\.member_id/
        expect { config.password }.to raise_error Configuration::MissingConfiguration, /configuration\.password/
        expect { config.api_key }.to raise_error Configuration::MissingConfiguration, /configuration\.api_key/
      end
    end
  end
end
