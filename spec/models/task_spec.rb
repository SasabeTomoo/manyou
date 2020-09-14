require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe '検索機能' do
    # 必要に応じて、テストデータの内容を変更して構わない
    # let!上書き
    # before do
    #   FactoryBot.create(:task_first, name: 'task')
    #   FactoryBot.create(:task_second, name: 'sample')
    # end
      let!(:task_first) { FactoryBot.create(:task_first, name: 'task', status: '完了') }
      let!(:task_second) { FactoryBot.create(:task_second, name: 'sample', status: '未着手')}
      let!(:task_third) { FactoryBot.create(:task_second, name: 'task2', status: '未着手')}

    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
        tasks = Task.all
        tasks = tasks.where('name LIKE ?', "%#{'task'}%")
        # tasks = ['task']
        expect(tasks).to include(task_first)
        expect(tasks).to include(task_third)
        expect(tasks).not_to include(task_second)
        expect(tasks.count).to eq 2
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        tasks = Task.all
        tasks = tasks.where(status: '未着手')
        expect(tasks).to include(task_second)
        expect(tasks).to include(task_third)
        expect(tasks).not_to include(task_first)
        expect(tasks.count).to eq 2
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        tasks = Task.all
        tasks = tasks.where('name LIKE ?', "%#{'task'}%")
        tasks = tasks.where(status: '未着手')
        expect(tasks).to include(task_third)
        expect(tasks).not_to include(task_first)
        expect(tasks).not_to include(task_second)
        expect(tasks.count).to eq 1
      end
    end
  end
end
