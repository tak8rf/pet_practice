require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
    let!(:task) { FactoryBot.create(:task, title: 'task') }
    let!(:user) { FactoryBot.create(:user) }
    before do
      new_user_registration
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'title', with: 'title_test'
        fill_in 'content', with: 'content_test'
        click_button 'submit'
        expect(page).to have_content 'title_test' && 'content_test' 
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        visit task_path(task)
        expect(page).to have_content 'task' 
       end
     end
  end
end