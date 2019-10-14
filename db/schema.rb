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

ActiveRecord::Schema.define(version: 20191010142830) do

  create_table "holidaybirds", force: :cascade do |t|
    t.string "channel"
    t.string "sku"
    t.string "description"
    t.integer "shipped"
    t.integer "ordered"
    t.integer "forecast"
    t.integer "harvest"
    t.datetime "datetime"
    t.string "cc"
    t.integer "adjustment"
    t.string "uom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turkey_caps", force: :cascade do |t|
    t.string "dc"
    t.string "channel"
    t.string "part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cap"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "holiday_bird_caps"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
