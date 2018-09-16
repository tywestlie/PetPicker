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

ActiveRecord::Schema.define(version: 2018_09_15_235854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "adopter_id"
    t.bigint "pet_id"
    t.index ["adopter_id"], name: "index_connections_on_adopter_id"
    t.index ["pet_id"], name: "index_connections_on_pet_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "body"
    t.integer "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "connection_id"
    t.index ["connection_id"], name: "index_messages_on_connection_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "species"
    t.string "description"
    t.string "pic"
    t.integer "age"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "species_to_adopt"
    t.integer "search_radius"
    t.decimal "lat"
    t.decimal "lng"
    t.integer "role", default: 0
    t.string "fb_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "key"
    t.string "pic"
    t.string "description"
  end

  add_foreign_key "connections", "pets"
  add_foreign_key "messages", "connections"
  add_foreign_key "pets", "users"
end
