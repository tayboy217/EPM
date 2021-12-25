require 'rails_helper'

RSpec.describe 'Taskモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { task.valid? }
    
    let(:task) { build(:task) }
    
    context 'wordカラムのテスト' do
      it '空白でないこと' do
        task.title = ""
        is_expected.to eq false
      end
    end
  end
end