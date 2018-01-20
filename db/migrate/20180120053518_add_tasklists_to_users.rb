class AddTasklistsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tasklists, :tasklist
  end
end
