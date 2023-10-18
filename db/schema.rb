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

ActiveRecord::Schema.define(version: 2023_10_18_082606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "animals", force: :cascade do |t|
    t.string "pet_type", null: false
    t.string "pet_name", null: false
    t.string "sex", null: false
    t.string "age", null: false
    t.string "vaccinated", null: false
    t.string "spayed_neutered", null: false
    t.text "note", null: false
    t.string "prefecture", null: false
    t.integer "trading_status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_animals_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.text "message"
    t.string "image"
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "animal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_favorites_on_animal_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "options", force: :cascade do |t|
    t.integer "answer1", null: false
    t.integer "answer2", null: false
    t.integer "answer3", null: false
    t.integer "answer4", null: false
    t.integer "answer5", null: false
    t.integer "answer6", null: false
    t.integer "answer7", null: false
    t.integer "answer8", null: false
    t.integer "answer9", null: false
    t.integer "answer10", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_options_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "animal_id", null: false
    t.index ["animal_id"], name: "index_rooms_on_animal_id"
  end

  create_table "trading_evaluations", force: :cascade do |t|
    t.text "feedback", null: false
    t.string "score", null: false
    t.bigint "user_id", null: false
    t.bigint "receive_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "room_id"
    t.string "get_animal", null: false
    t.index ["room_id"], name: "index_trading_evaluations_on_room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "nick_name", null: false
    t.string "postal_code", null: false
    t.string "prefecture", null: false
    t.string "municipality", null: false
    t.string "street_address", null: false
    t.integer "movable_range", null: false
    t.string "sex", null: false
    t.string "occupation", null: false
    t.string "phone_number", null: false
    t.boolean "admin", default: false, null: false
    t.string "icon"
    t.text "self_introduction", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "terms_of_use", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "animals", "users"
  add_foreign_key "chats", "rooms"
  add_foreign_key "chats", "users"
  add_foreign_key "entries", "rooms"
  add_foreign_key "entries", "users"
  add_foreign_key "favorites", "animals"
  add_foreign_key "favorites", "users"
  add_foreign_key "options", "users"
  add_foreign_key "rooms", "animals"
  add_foreign_key "trading_evaluations", "rooms"
end
