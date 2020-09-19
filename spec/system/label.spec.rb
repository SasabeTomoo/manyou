require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        FactoryBot.create(:user)
        FactoryBot.create(:task_first, user_id: 1 )
        visit new_session_path
        fill_in 'session_email', with: 'satou@gmail.com'
        fill_in 'session_password', with: 'satousan'
        click_on 'Log in'
        visit new_task_path
        fill_in 'task_name', with: 'test2'
        fill_in 'task_content', with: 'content2'
        select  '未着手', from: 'ステータス'
        click_on '登録する'
        expect(page).to have_content 'test2'
        expect(page).to have_content 'content2'
        expect(page).to have_content '未着手'
      end
    end
  end
end
