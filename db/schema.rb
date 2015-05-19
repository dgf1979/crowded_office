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

ActiveRecord::Schema.define(version: 20150519215654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies_orders", force: :cascade do |t|
    t.integer "company_id"
    t.integer "order_id"
  end

  add_index "companies_orders", ["company_id"], name: "index_companies_orders_on_company_id", using: :btree
  add_index "companies_orders", ["order_id"], name: "index_companies_orders_on_order_id", using: :btree

  create_table "lines", force: :cascade do |t|
    t.integer  "supply_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  create_table "lines_orders", force: :cascade do |t|
    t.integer "line_id"
    t.integer "order_id"
  end

  add_index "lines_orders", ["line_id"], name: "index_lines_orders_on_line_id", using: :btree
  add_index "lines_orders", ["order_id"], name: "index_lines_orders_on_order_id", using: :btree

  create_table "months", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "month_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
  end

  create_table "supplies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
