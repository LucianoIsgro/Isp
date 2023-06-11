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

ActiveRecord::Schema[7.0].define(version: 2023_06_05_211949) do
  create_table "clients", force: :cascade do |t|
    t.string "nombre"
    t.integer "dni"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "internet_providers", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.integer "internet_provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["internet_provider_id"], name: "index_plans_on_internet_provider_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "estado", default: 0
    t.integer "client_id"
    t.integer "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_requests_on_client_id"
    t.index ["plan_id"], name: "index_requests_on_plan_id"
  end

  add_foreign_key "plans", "internet_providers"
  add_foreign_key "requests", "clients"
  add_foreign_key "requests", "plans"
end
