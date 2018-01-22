class RemoveCompletedFromTasklist < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasklists, :completed, :task
  end
end
