class RenameTagColumnToLabels < ActiveRecord::Migration[5.2]
  def change
    rename_column :labels, :tag, :name
  end
end
