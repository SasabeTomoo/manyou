class AddDetailsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :expired_at, :date, null: false, default: -> { 'NOW()' }
  end
end
