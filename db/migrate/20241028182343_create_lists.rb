class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists, id: :uuid do |t|
      t.string :name, null: false
      t.integer :position
    end
  end
end