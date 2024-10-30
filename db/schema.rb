ActiveRecord::Schema[7.1].define(version: 2024_10_28_184440) do
  enable_extension "plpgsql"

  create_table "lists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.integer "position"
  end

  create_table "tasks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.uuid "list_id", null: false
    t.integer "list_position"
    t.index ["list_id"], name: "index_tasks_on_list_id"
  end

  add_foreign_key "tasks", "lists", on_delete: :cascade
end

