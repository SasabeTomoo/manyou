require 'rails_helper'

describe 'ラベル機能', type: :system do
  context 'タスクを作成した場合' do
    before do
      FactoryBot.create(:user)
      FactoryBot.create(:task_first, id: 1, user_id: 1 )
      FactoryBot.create(:label_first )
      FactoryBot.create(:label_second )
      FactoryBot.create(:labelling_first )
      FactoryBot.create(:labelling_second )
      visit new_session_path
      fill_in 'session_email', with: 'satou@gmail.com'
      fill_in 'session_password', with: 'satousan'
      click_on 'Log in'
    end
    it 'タスクに複数のラベルをつけられる' do
      visit task_path(1)
      expect(page).to have_content '開発'
      expect(page).to have_content '運用'
    end
    it 'タスクのラベルを編集できる' do
      visit edit_task_path(1)
      # binding.irb
      check 'task_label_ids_1'
      click_on '更新する'
      visit task_path(1)
      expect(page).to have_content '開発'
      expect(page).not_to have_content '運用'
    end
    it 'タスクの詳細画面で、そのタスクに紐づくラベル一覧を出力できる（タスク複数ラベルと重複）' do
      visit task_path(1)
      expect(page).to have_content '開発'
      expect(page).to have_content '運用'
    end
    it 'つけたラベルで検索ができる' do
      visit new_task_path
      fill_in 'task_name', with: 'リストなし'
      fill_in 'task_content', with: 'リストなし'
      select  '未着手', from: 'ステータス'
      click_on '登録する'
      visit tasks_path
      select '開発', from: 'label_id'
      click_on 'ラベル検索'
      sleep 0.5
      expect(page).to have_content 'name1'
      expect(page).not_to have_content 'リストなし'
    end
  end
end
