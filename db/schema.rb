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

ActiveRecord::Schema.define(version: 20170327152446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  create_table "agendas", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "event_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["event_id"], name: "index_agendas_on_event_id", using: :btree
    t.index ["restaurant_id"], name: "index_agendas_on_restaurant_id", using: :btree
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dishes_restaurants", id: false, force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.integer "dish_id",       null: false
    t.index ["dish_id", "restaurant_id"], name: "index_dishes_restaurants_on_dish_id_and_restaurant_id", using: :btree
    t.index ["restaurant_id", "dish_id"], name: "index_dishes_restaurants_on_restaurant_id_and_dish_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.time     "time"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "events_restaurants", id: false, force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.integer "event_id",      null: false
    t.index ["event_id", "restaurant_id"], name: "index_events_restaurants_on_event_id_and_restaurant_id", using: :btree
    t.index ["restaurant_id", "event_id"], name: "index_events_restaurants_on_restaurant_id_and_event_id", using: :btree
  end

  create_table "menus", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "dish_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["dish_id"], name: "index_menus_on_dish_id", using: :btree
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "agendas", "events"
  add_foreign_key "agendas", "restaurants"
  add_foreign_key "menus", "dishes"
  add_foreign_key "menus", "restaurants"
end
