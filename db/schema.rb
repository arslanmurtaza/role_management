# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_10_11_140034) do
  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.string "resource_type"
    t.boolean "collapsible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_resources_on_parent_id"
  end

  create_table "role_permissions", force: :cascade do |t|
    t.integer "user_role_id", null: false
    t.integer "permission_id", null: false
    t.integer "resource_id", null: false
    t.boolean "enabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["resource_id"], name: "index_role_permissions_on_resource_id"
    t.index ["user_role_id"], name: "index_role_permissions_on_user_role_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "resources", "resources", column: "parent_id"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "resources"
  add_foreign_key "role_permissions", "user_roles"
end
