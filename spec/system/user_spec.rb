require 'rails_helper'
RSpec.describe 'ユーザー登録機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  describe 'ユーザ登録のテスト' do
    context '新規登録画面に遷移した場合' do
      it 'ユーザの新規登録ができること' do
        visit('/users/sign_up')
        binding.pry
        fill_in 'email', with: 'user3@aaa.com'
        fill_in 'password', with: '111111'
        fill_in 'password_confirmation', with: '11111'
        click_button 'Sign up'
        expect(page).to have_content 'user3@aaa.com'
      end
    end

    context 'ユーザがログインせずタスク一覧画面に飛ぼうとしたとき' do
      it 'ログイン画面に遷移すること' do
        visit posts_path
        expect(page).to have_content 'Login'
      end
    end
  end

  describe 'セッション機能のテスト' do
    context 'セッション機能のテスト' do
      it 'ログインができること & 自分の詳細画面(マイページ)に飛べること' do
        visit new_session_path
        fill_in 'email', with: 'user@aaa.com'
        fill_in 'password', with: '1111'
        click_button 'Log in'
        expect(current_path).to include '/users/'
        expect(page).to have_content 'user@aaa.com'
      end

      it '一般ユーザが他人の詳細画面に飛ぶとタスク一覧画面に遷移すること' do
        visit new_session_path
        fill_in 'email', with: 'user@aaa.com'
        fill_in 'password', with: '1111'
        click_button 'Log in'
        visit user_path(1)
        expect(current_path).to include '/tasks'
      end
      it 'ログアウトができること' do
        visit new_session_path
        fill_in 'email', with: 'user@aaa.com'
        fill_in 'password', with: '1111'
        click_button 'Log in'
        url = current_url
        click_on 'Logout'
        visit url
        expect(current_path).to include 'sessions/new'
      end
    end
  end
end