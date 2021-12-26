require 'rails_helper'

describe 'ユーザログイン後のテスト' do
  let(:user) { create(:user) }
  let(:note) { create(:note, user: user) }
  let(:task) { create(:task, user: user) }
  let(:contact) { create(:contact) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
    end
  end

  describe 'Home画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
    end
  end

  describe 'Mypage画面のテスト' do
    before do
      visit '/users'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users'
      end
    end
  end

  describe 'Note画面のテスト' do
    before do
      visit '/notes/remember_index'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/notes/remember_index'
      end
    end
  end

  describe 'Task画面のテスト' do
    before do
      visit '/tasks'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/tasks'
      end
    end
  end

  describe 'Schedule画面のテスト' do
    before do
      visit '/tasks'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/tasks'
      end
    end
  end

  describe 'Contact画面のテスト' do
    before do
      visit '/contacts/new'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/contacts/new'
      end
    end
  end
end
