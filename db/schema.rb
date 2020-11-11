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

ActiveRecord::Schema.define(version: 20201110155058) do

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "sku_code"
    t.float    "price"
    t.integer  "low_item_threshold"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_count"
    t.integer  "ware_house_id"
  end

  create_table "ware_houses", force: true do |t|
    t.string   "name"
    t.string   "wh_code"
    t.string   "pincode"
    t.integer  "max_capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
