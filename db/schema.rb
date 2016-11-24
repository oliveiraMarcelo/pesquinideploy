# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160615032126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enterprises", force: :cascade do |t|
    t.string  "cnpj"
    t.string  "corporate_name"
    t.integer "sanctions_count", default: 0
    t.float   "payments_sum",    default: 0.0
  end

  add_index "enterprises", ["cnpj"], name: "index_enterprises_on_cnpj", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string  "identifier",     default: ""
    t.string  "process_number", default: ""
    t.float   "initial_value"
    t.date    "sign_date"
    t.date    "start_date"
    t.date    "end_date"
    t.integer "enterprise_id"
  end

  add_index "payments", ["enterprise_id"], name: "index_payments_on_enterprise_id", using: :btree
  add_index "payments", ["process_number"], name: "index_payments_on_process_number", using: :btree

  create_table "sanction_types", force: :cascade do |t|
    t.string "description"
    t.string "legal_foundation"
    t.string "foundation_description"
  end

  add_index "sanction_types", ["id"], name: "index_sanction_types_on_id", using: :btree

  create_table "sanctions", force: :cascade do |t|
    t.date    "initial_date"
    t.date    "final_date"
    t.string  "process_number"
    t.integer "enterprise_id"
    t.integer "sanction_type_id"
    t.integer "state_id"
    t.string  "sanction_organ",   default: ""
  end

  add_index "sanctions", ["process_number"], name: "index_sanctions_on_process_number", using: :btree
  add_index "sanctions", ["sanction_type_id"], name: "index_sanctions_on_sanction_type_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.integer "code"
    t.string  "name"
    t.string  "abbreviation"
  end

  add_index "states", ["id"], name: "index_states_on_id", using: :btree
  add_index "states", ["name"], name: "index_states_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "password_digest"
    t.string "remember_token"
    t.string "type"
  end

end
