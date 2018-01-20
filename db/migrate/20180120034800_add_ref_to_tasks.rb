class AddRefToTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasks, :tasklist, foreign_key: true
  end
end
