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

ActiveRecord::Schema.define(version: 2021_05_06_171438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "admins_hotels", id: false, force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.bigint "hotel_id", null: false
    t.index ["admin_id", "hotel_id"], name: "index_admins_hotels_on_admin_id_and_hotel_id"
    t.index ["hotel_id", "admin_id"], name: "index_admins_hotels_on_hotel_id_and_admin_id"
  end

  create_table "breakfasts", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reservation_id"], name: "index_breakfasts_on_reservation_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.integer "city", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_reservations_on_room_id"
  end

  create_table "reservations_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "reservation_id", null: false
    t.index ["reservation_id", "user_id"], name: "index_reservations_users_on_reservation_id_and_user_id"
    t.index ["user_id", "reservation_id"], name: "index_reservations_users_on_user_id_and_reservation_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "hotel_id", null: false
    t.integer "number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  create_table "user_breakfasts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "breakfast_id", null: false
    t.integer "place", default: 0
    t.integer "time", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["breakfast_id"], name: "index_user_breakfasts_on_breakfast_id"
    t.index ["user_id"], name: "index_user_breakfasts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "breakfasts", "reservations"
  add_foreign_key "reservations", "rooms"
  add_foreign_key "rooms", "hotels"
  add_foreign_key "user_breakfasts", "breakfasts"
  add_foreign_key "user_breakfasts", "users"
end
