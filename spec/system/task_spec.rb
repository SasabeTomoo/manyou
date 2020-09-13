require 'rails_helper'
describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task_name', with: 'test2'
        fill_in 'task_content', with: 'content2'
        # binding.irb
        click_on '登録する'
        expect(page).to have_content 'test2'
        expect(page).to have_content 'content2'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        # テストで使用するためのタスクを作成
        task = FactoryBot.create(:task, name: 'name', content: 'content')
        # タスク一覧ページに遷移
        visit tasks_path
        # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
        # binding.irb
        expect(page).to have_content 'content'
        # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      before do
        FactoryBot.create(:task_first)
        FactoryBot.create(:task_second)
        FactoryBot.create(:task_third)
      end
      it '新しいタスクが一番上に表示される' do
        visit tasks_path
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'name3'
        expect(task_list[1]).to have_content 'content3'
        expect(task_list[2]).to have_content 'name2'
        expect(task_list[3]).to have_content 'content2'
        expect(task_list[4]).to have_content 'name1'
        expect(task_list[5]).to have_content 'content1'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         task = FactoryBot.create(:task, name: 'name', content: 'content')
         visit task_path(task.id)
         expect(page).to have_content 'name'
         expect(page).to have_content 'content'
       end
     end
  end
end
