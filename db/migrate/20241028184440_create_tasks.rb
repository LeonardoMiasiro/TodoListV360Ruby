class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :name, null: false
      t.text :description
      t.uuid :list_id, null: false
      t.integer :list_position
    end

    add_foreign_key :tasks, :lists, column: :list_id, on_delete: :cascade
    add_index :tasks, :list_id
  end
end