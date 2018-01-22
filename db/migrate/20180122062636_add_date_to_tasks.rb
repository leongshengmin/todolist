class AddDateToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :date, :date
  end
end
