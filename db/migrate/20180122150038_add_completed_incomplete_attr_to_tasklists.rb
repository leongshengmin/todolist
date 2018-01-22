class AddCompletedIncompleteAttrToTasklists < ActiveRecord::Migration[5.1]
  def change
    add_column :tasklists, :completed, :task
  end
end
