class RemoveIncompleteFromTasklist < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasklists, :incomplete, :task
  end
end
