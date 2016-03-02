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

ActiveRecord::Schema.define(version: 20160302050719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "passangers", force: :cascade do |t|
    t.string   "name",                   default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "passangers", ["confirmation_token"], name: "index_passangers_on_confirmation_token", unique: true, using: :btree
  add_index "passangers", ["email"], name: "index_passangers_on_email", unique: true, using: :btree
  add_index "passangers", ["reset_password_token"], name: "index_passangers_on_reset_password_token", unique: true, using: :btree

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer  "railway_station_id"
    t.integer  "route_id"
    t.integer  "sort_number",        default: 0
    t.datetime "arrive_time"
    t.datetime "leave_time"
  end

  add_index "railway_stations_routes", ["railway_station_id"], name: "index_railway_stations_routes_on_railway_station_id", using: :btree
  add_index "railway_stations_routes", ["route_id"], name: "index_railway_stations_routes_on_route_id", using: :btree

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "number"
    t.string   "seat"
    t.datetime "arrive_time"
    t.datetime "leave_time"
    t.string   "passanger_info"
    t.integer  "end_station_id"
    t.integer  "start_station_id"
    t.integer  "passanger_id"
    t.integer  "train_id"
  end

  add_index "tickets", ["end_station_id"], name: "index_tickets_on_end_station_id", using: :btree
  add_index "tickets", ["passanger_id"], name: "index_tickets_on_passanger_id", using: :btree
  add_index "tickets", ["start_station_id"], name: "index_tickets_on_start_station_id", using: :btree
  add_index "tickets", ["train_id"], name: "index_tickets_on_train_id", using: :btree

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "current_station_id"
    t.integer  "route_id"
    t.boolean  "reverse_sort",       default: false
  end

  add_index "trains", ["current_station_id"], name: "index_trains_on_current_station_id", using: :btree
  add_index "trains", ["route_id"], name: "index_trains_on_route_id", using: :btree

  create_table "wagons", force: :cascade do |t|
    t.integer "number"
    t.integer "top_places"
    t.integer "bottom_places"
    t.integer "side_top_places"
    t.integer "side_bottom_places"
    t.integer "seat_places"
    t.integer "train_id"
    t.string  "type"
  end

  add_index "wagons", ["id", "type"], name: "index_wagons_on_id_and_type", using: :btree
  add_index "wagons", ["train_id"], name: "index_wagons_on_train_id", using: :btree

end
