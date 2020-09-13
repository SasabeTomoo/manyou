class RemoveDatailFromTasks < ActiveRecord::Migration[5.2]
  def up
    remove_column :tasks, :expired_at, :datetime
  end

  def down
    add_column :tasks, :expired_at, :datetime
  end
end
