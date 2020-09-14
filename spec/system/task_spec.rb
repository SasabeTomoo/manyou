require 'rails_helper'
describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task_name', with: 'test2'
        fill_in 'task_content', with: 'content2'
        select  '未着手', from: 'ステータス'
        # binding.irb
        click_on '登録する'
        expect(page).to have_content 'test2'
        expect(page).to have_content 'content2'
        expect(page).to have_content '未着手'
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
      it '「終了期限でソートする」をクリックすると期限順（降順）で表示し直される' do
        visit tasks_path
        click_link '終了期限でソートする（降順）'
        task_list = all('.task_expired')
        sleep 1.0
        expect(task_list[0]).to have_content '2020-09-03'
        expect(task_list[1]).to have_content '2020-09-02'
        expect(task_list[2]).to have_content '2020-09-01'
      end
      it '「優先順位でソートする（重要順）」をクリックすると期限順（降順）で表示し直される' do
        visit tasks_path
        click_link '優先順位でソートする（重要順）'
        task_list = all('.task_priority')
        sleep 1.0
        expect(task_list[0]).to have_content '高'
        expect(task_list[1]).to have_content '中'
        expect(task_list[2]).to have_content '低'
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
  describe '検索機能' do
    before do
      # 必要に応じて、テストデータの内容を変更して構わない
      FactoryBot.create(:task_first, name: "task1", status: "未着手")
      FactoryBot.create(:task_second, name: "task2", status: "完了")
      FactoryBot.create(:task_second, name: "sample", status: "完了")
    end
    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        # タスクの検索欄に検索ワードを入力する (例: task)
        fill_in 'search1', with: 'ta'
        # 検索ボタンを押す
        click_on '検索'
        expect(page).to have_content 'task1'
      end
    end
    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        visit tasks_path
        # プルダウンを選択する「select」について調べてみること
        select '未着手', from: 'search2'
        click_on '検索'
        expect(page).to have_content 'task1'
        expect(page).to have_no_content 'sample'
      end
    end
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        visit tasks_path
        fill_in 'search1', with: 'ta'
        select '完了', from: 'search2'
        click_on '検索'
        expect(page).to have_no_content 'task1'
        expect(page).to have_content 'task2'
      end
    end
  end
end
