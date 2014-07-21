require 'spec_helper'

module SermonAudio
  describe Operations do
    subject(:operation) { Class.new.extend(Operations) }

    describe '#get_sermon_info' do
      it "should return the correct result", vcr: true do
        result = operation.get_sermon_info(720141933368)
        expect(result[:sermon_id]).to eq "720141933368"
        expect(result[:speaker]).to eq "Mitchell Jones"
        expect(result[:bible_text]).to eq "Psalm 23:4"
        expect(result[:sub_title]).to eq "Psalm 23"
      end
    end

  end
end
