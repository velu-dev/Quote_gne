# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170907052645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currency_types", force: :cascade do |t|
    t.string "type_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "process_details", force: :cascade do |t|
    t.string "process_name"
    t.integer "parent_process_id"
    t.float "cost"
    t.integer "project_detail", array: true
    t.bigint "currency_type_id"
    t.bigint "uom_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_type_id"], name: "index_process_details_on_currency_type_id"
    t.index ["uom_detail_id"], name: "index_process_details_on_uom_detail_id"
  end

  create_table "project_details", force: :cascade do |t|
    t.string "project_name"
    t.string "description"
    t.boolean "status"
    t.bigint "user_id"
    t.bigint "project_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_type_id"], name: "index_project_details_on_project_type_id"
    t.index ["user_id"], name: "index_project_details_on_user_id"
  end

  create_table "project_types", force: :cascade do |t|
    t.string "type_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quote_details", force: :cascade do |t|
    t.string "quote_no"
    t.float "cost"
    t.float "discount"
    t.float "total_cost"
    t.boolean "status"
    t.bigint "user_id"
    t.bigint "currency_type_id"
    t.bigint "project_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_type_id"
    t.index ["currency_type_id"], name: "index_quote_details_on_currency_type_id"
    t.index ["project_detail_id"], name: "index_quote_details_on_project_detail_id"
    t.index ["project_type_id"], name: "index_quote_details_on_project_type_id"
    t.index ["user_id"], name: "index_quote_details_on_user_id"
  end

  create_table "service_details", force: :cascade do |t|
    t.string "service_name"
    t.string "service_id"
    t.bigint "project_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_detail_id"], name: "index_service_details_on_project_detail_id"
  end

  create_table "uom_details", force: :cascade do |t|
    t.string "uom_type"
    t.float "cost"
    t.string "description"
    t.bigint "currency_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_type_id"], name: "index_uom_details_on_currency_type_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "role_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string "type_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email_id"
    t.string "address"
    t.string "mobile_no"
    t.string "username"
    t.string "password"
    t.bigint "user_type_id"
    t.bigint "user_role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
    t.string "business_details"
    t.boolean "status"
    t.index ["user_role_id"], name: "index_users_on_user_role_id"
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  add_foreign_key "process_details", "currency_types"
  add_foreign_key "process_details", "uom_details"
  add_foreign_key "project_details", "project_types"
  add_foreign_key "project_details", "users"
  add_foreign_key "quote_details", "currency_types"
  add_foreign_key "quote_details", "project_details"
  add_foreign_key "quote_details", "project_types"
  add_foreign_key "quote_details", "users"
  add_foreign_key "service_details", "project_details"
  add_foreign_key "uom_details", "currency_types"
  add_foreign_key "users", "user_roles"
  add_foreign_key "users", "user_types"
end
