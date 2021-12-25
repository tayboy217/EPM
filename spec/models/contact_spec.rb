require 'rails_helper'

RSpec.describe 'Contactモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { contact.valid? }
    
    let(:contact) { build(:contact) }
    
    context 'titleカラムのテスト' do
      it '空白でないこと' do
        contact.title = ""
        is_expected.to eq false
      end
    end
    
    context 'bodyカラムのテスト' do
      it '空白でないこと' do
        contact.body = ""
        is_expected.to eq false
      end
    end
  end
end