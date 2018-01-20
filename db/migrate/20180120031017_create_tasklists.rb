class CreateTasklists < ActiveRecord::Migration[5.1]
  def change
    create_table :tasklists do |t|
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
