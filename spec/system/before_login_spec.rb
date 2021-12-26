require 'rails_helper'

describe 'ユーザログイン前のテスト' do
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
  
  describe '新規登録画面のテスト' do
    before do
      visit '/users/sign_up'
    end
    
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '新規会員登録と表示される' do
        expect(page).to have_content '新規会員登録'
      end
      it '名前が表示される' do
        expect(page).to have_field 'user[name]'
      end
      it 'メールアドレスが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'パスワードが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it '確認用パスワードが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '登録ボタンが表示される' do
        expect(page).to have_button '登録'
      end
    end
  end
  
  describe 'ログイン画面のテスト' do
    before do
      visit '/users/sign_in'
    end
    
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it 'ログインと表示される' do
        expect(page).to have_content 'ログイン'
      end
      it 'メールアドレスが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'パスワードが表示される' do
        expect(page).to have_field 'user[password]'
      end
    end
  end
end

describe '管理者ログイン前のテスト' do
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
  
  describe '管理者ログイン画面のテスト' do
    before do
      visit '/admins/sign_in'
    end
    
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/admins/sign_in'
      end
      it 'ログインと表示される' do
        expect(page).to have_content 'ログイン'
      end
      it 'メールアドレスが表示される' do
        expect(page).to have_field 'admin[email]'
      end
      it 'パスワードが表示される' do
        expect(page).to have_field 'admin[password]'
      end
    end
  end
end