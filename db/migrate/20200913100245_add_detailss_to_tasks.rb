class AddDetailssToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :status, :string, default: '選択なし', null: false
  end
end
