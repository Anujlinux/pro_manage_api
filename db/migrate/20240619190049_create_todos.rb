class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.boolean :completed, default: false, null: false
      t.date :completed_at
      t.references :todo_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
