class CreateTodoLists < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_lists do |t|
      t.string :title, null: false
      t.integer :status, default: 0, null: false
      t.integer :priority, default: 1, null: false
      t.date :due_date
      t.boolean :shared, default: false, null: false
      t.string :assigned, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
