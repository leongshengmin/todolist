class CreateTasklists < ActiveRecord::Migration[5.1]
  def change
    create_table :tasklists do |t|
      t.string :title
      t.task :tasks
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
