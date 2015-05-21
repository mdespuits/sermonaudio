require 'spec_helper'
require 'savon/mock/spec_helper'

module SermonAudio
  RSpec.describe Actions do
    include Savon::SpecHelper

    subject(:action) { Class.new.extend(Actions) }

    CURRENT_SA_LANGS = %w[
      Afrikaans Arabic Burundi Catalan Chinese
      Choctaw Czech Danish Dutch Finnish
      French German Greek Haitian-Creole Hebrew
      Hindi Hungarian Indonesian Italian Japanese
      Khmer Korean Mongolian Persian Portuguese
      Punjabi Romanian Russian Scots-Gaelic Sign-ASL
      Sign-Mexico Spanish Tagalog Tamil Telugu
      Ukrainian Urdu Vietnamese Zulu
    ]

    describe 'stubbed expectations'  do

      before(:all) { savon.mock! }
      after(:all)  { savon.unmock! }

      before do
        allow(SermonAudio).to receive(:client) do
          Savon.client {
            wsdl 'spec/fixtures/wsdl.xml'
            soap_version 2
          }
        end
      end

      describe '#submit_sermon' do
        it "should send the correct message and return the expected results" do
          info = {
            'MemberID' => 'cbcelgin',
            'Password' => 'password',
            'Title' => 'Example Sermon',
            'ShortTitle' => 'Even Shorter',
            'SubTitle' => 'Series Name',
            'EventType' => 'Sunday Service',
            'DatePreached' => DateTime.new(2014, 7, 24),
            'Speaker' => 'Mitchell Jones',
            'BibleText' => '1 Peter 2:21-25',
            'Language' => 'English',
            'Keywords' => 'bible jesus gospel',
            'MoreInfoText' => 'This is more info about the sermon'
          }

          fixture = File.read('spec/fixtures/submit_sermon.xml')
          savon.expects(:submit_sermon).with(message: info).returns fixture

          result = action.submit_sermon(info)
          expect(result).to eq "Response Value"
        end
      end

      describe '#update_sermon' do
        it "should send the correct message and return the expected results" do
          info = {
            'MemberID' => 'cbcelgin',
            'Password' => 'password',
            'SermonID' => '9827374839872',
            'Title' => 'Example Sermon',
            'ShortTitle' => 'Even Shorter',
            'SubTitle' => 'Series Name',
            'EventType' => 'Sunday Service',
            'DatePreached' => DateTime.new(2014, 7, 24),
            'Speaker' => 'Mitchell Jones',
            'BibleText' => '1 Peter 2:21-25',
            'Language' => 'English',
            'Keywords' => 'bible jesus gospel',
            'MoreInfoText' => 'This is more info about the sermon'
          }

          fixture = File.read('spec/fixtures/update_sermon.xml')
          savon.expects(:update_sermon).with(message: info).returns fixture

          result = action.update_sermon(info)
          expect(result).to eq nil
        end
      end

    end

    describe '#sermon_list' do
      it "should return a list of sermons for the specified church", vcr: true do
        result = action.sermon_list(:cbcelgin)
        expect(result.last[:sermon_id]).to eq "515111348415"
        expect(result.last[:title]).to eq "A Faith To Die With"
        expect(result.last[:sub_title]).to be_nil
        expect(result.last[:speaker]).to eq "Mitchell Jones"
        expect(result.last[:event_type]).to eq "Sunday - AM"
        expect(result.last[:bible_text]).to eq "Hebrews"
        expect(result.last[:download_count]).to eq "62"
        expect(result.last[:mp3_duration]).to eq "64 minutes"
        expect(result.last[:mp3_filename]).to eq "http://mp3.sa-media.com/filearea/515111348415/515111348415.mp3"
      end
    end

    describe '#get_sermon_info' do
      it "should return the correct result", vcr: true do
        result = action.get_sermon_info(720141933368)
        expect(result[:sermon_id]).to eq "720141933368"
        expect(result[:speaker]).to eq "Mitchell Jones"
        expect(result[:bible_text]).to eq "Psalm 23:4"
        expect(result[:sub_title]).to eq "Psalm 23"
      end
    end

    describe '#favorite_sermons' do
      it "should return the correct result", vcr: true do
        result = action.favorite_sermons
        expect(result[0][:sermon_id]).to eq "7101111626"
        expect(result[0][:title]).to eq "This Is My Comfort"
        expect(result[0][:sub_title]).to eq nil
        expect(result[0][:speaker]).to eq "Mitchell Jones"
        expect(result[0][:event_type]).to eq "Sunday Service"
        expect(result[0][:bible_text]).to eq nil
        expect(result[0][:download_count]).to eq "0"
        expect(result[0][:mp3_duration]).to eq nil
        expect(result[0][:mp3_filename]).to eq nil
      end
    end

    describe '#favorite_speakers' do
      it "should return the correct result", vcr: true do
        result = action.favorite_speakers
        expect(result[0]).to eq({speaker_name: "Pastor Tim Goad", sort_name: "Goad, Tim", counter: "470"})
        expect(result[1]).to eq({speaker_name: "Mitchell Jones", sort_name: "Jones, Mitchell", counter: "216"})
      end
    end

    describe '#favorite_broadcasters' do
      it "should return the correct result", vcr: true do
        result = action.favorite_broadcasters
        expect(result[0][:source_id]).to eq "cbcelgin"
        expect(result[0][:source_desc]).to eq "Cornerstone Baptist Church"
        expect(result[0][:source_location]).to eq "Elgin, Texas"
        expect(result[0][:minister]).to eq "Pastor Mitchell Jones"
      end
    end

    describe '#get_speakers_by_member_id' do
      it "should return the correct results", vcr: true do
        result = action.get_speakers_by_member_id(:cbcelgin)
        expect(result).to include "Mitchell Jones"
        expect(result).to include "Kevin Bridges"
        expect(result).to include "Pastor Tim Goad"
      end
    end

    describe '#get_series_by_member_id' do
      it "should return the correct results", vcr: true do
        result = action.get_series_by_member_id(:cbcelgin)
        expect(result).to eq [
          "1 Corinthians 13", "1 Peter", "Psalm 23",
          "The Beatitudes", "The Nature Of Repentance"
        ]
      end
    end

    describe '#get_newest_series_by_member_id' do
      it "should return the correct results", vcr: true do
        result = action.get_newest_series_by_member_id(:cbcelgin)
        expect(result[0]).to eq "Psalm 23"
        expect(result[1]).to eq "1 Peter"
      end
    end

    describe '#newest_sermons_by_member_id' do
      it "should return the correct results", vcr: true do
        result = action.newest_sermons_by_member_id(:cbcelgin)
        expect(result[0][:sermon_id]).to eq "720141933368"
        expect(result[0][:title]).to eq "Facing Death"
        expect(result[0][:sub_title]).to eq "Psalm 23"
        expect(result[0][:speaker]).to eq "Mitchell Jones"
        expect(result[0][:event_type]).to eq "Sunday - PM"
        expect(result[0][:bible_text]).to eq "Psalm 23:4"
        expect(result[0][:download_count]).to eq "9"
        expect(result[0][:mp3_duration]).to eq "39 minutes"
        expect(result[0][:mp3_filename]).to eq "http://mp3.sa-media.com/filearea/720141933368/720141933368.mp3"
      end
    end

    describe '#newest_sermons_by_speaker' do
      it "should return the correct results", vcr: true do
        result = action.newest_sermons_by_speaker("Mitchell Jones")
        expect(result[0][:sermon_id]).to eq "720141933368"
        expect(result[0][:title]).to eq "Facing Death"
        expect(result[0][:sub_title]).to eq "Psalm 23"
        expect(result[0][:speaker]).to eq "Mitchell Jones"
        expect(result[0][:event_type]).to eq "Sunday - PM"
        expect(result[0][:bible_text]).to eq "Psalm 23:4"
        expect(result[0][:download_count]).to eq "9"
        expect(result[0][:mp3_duration]).to eq "39 minutes"
        expect(result[0][:mp3_filename]).to eq "http://mp3.sa-media.com/filearea/720141933368/720141933368.mp3"
      end
    end

    describe '#get_event_types' do
      it "should return the correct results", vcr: true do
        result = action.get_event_types
        expect(result).to include "Audio Book"
        expect(result).to include "Bible Study"
        expect(result).to include "Camp Meeting"
        expect(result).to include "Sunday - PM"
        expect(result).to include "Youth"
      end
    end

    describe '#get_languages' do
      it "should return the correct results", vcr: true do
        result = action.get_languages
        expect(result.sort).to eq CURRENT_SA_LANGS.sort
      end
    end

    describe '#get_speakers_by_keyword' do
      it "should return a larger set of results", vcr: true do
        result = action.get_speakers_by_keyword("Mitchell")
        expect(result.count).to be > 30
        expect(result).to include "Mitchell Jones"
        expect(result).to include "Timothy Mitchell"
      end

      it "should return a single result", vcr: true do
        result = action.get_speakers_by_keyword("Mitchell Jones")
        expect(result).to eq "Mitchell Jones"
      end
    end

  end
end
