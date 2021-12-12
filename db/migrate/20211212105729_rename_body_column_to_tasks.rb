class RenameBodyColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :body, :title
  end
end
