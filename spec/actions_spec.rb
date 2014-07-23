require 'spec_helper'

module SermonAudio
  describe Actions do
    subject(:action) { Class.new.extend(Actions) }

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

    describe '#get_event_types' do
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
