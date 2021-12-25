require 'rails_helper'

RSpec.describe 'Noteモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { note.valid? }

    let(:note) { build(:note) }

    context 'wordカラムのテスト' do
      it '空白でないこと' do
        note.word = ""
        is_expected.to eq false
      end
    end

    context 'englishカラムのテスト' do
      it '空白でないこと' do
        note.english = ""
        is_expected.to eq false
      end
    end

    context 'jpaneseカラムのテスト' do
      it '空白でないこと' do
        note.japanese = ""
        is_expected.to eq false
      end
    end
  end
end
