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

ActiveRecord::Schema.define(version: 2018_10_08_094216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "tickets_id"
    t.string "state"
    t.date "event_date"
    t.boolean "featured", default: false
    t.index ["tickets_id"], name: "index_campaigns_on_tickets_id"
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "campaigns_genres", id: false, force: :cascade do |t|
    t.bigint "campaign_id"
    t.bigint "genre_id"
    t.index ["campaign_id"], name: "index_campaigns_genres_on_campaign_id"
    t.index ["genre_id"], name: "index_campaigns_genres_on_genre_id"
  end

  create_table "campaigns_performers", id: false, force: :cascade do |t|
    t.bigint "campaign_id", null: false
    t.bigint "performer_id", null: false
    t.index ["campaign_id", "performer_id"], name: "index_campaigns_performers_on_campaign_id_and_performer_id"
    t.index ["performer_id", "campaign_id"], name: "index_campaigns_performers_on_performer_id_and_campaign_id"
  end

  create_table "event_tickets", force: :cascade do |t|
    t.bigint "user_id"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_event_tickets_on_campaign_id"
    t.index ["user_id"], name: "index_event_tickets_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.string "followable_type", null: false
    t.bigint "followable_id", null: false
    t.string "follower_type", null: false
    t.bigint "follower_id", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable_type_and_followable_id"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
    t.index ["follower_type", "follower_id"], name: "index_follows_on_follower_type_and_follower_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_performers", id: false, force: :cascade do |t|
    t.bigint "performer_id"
    t.bigint "genre_id"
    t.index ["genre_id"], name: "index_genres_performers_on_genre_id"
    t.index ["performer_id"], name: "index_genres_performers_on_performer_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type"
    t.integer "quantity"
    t.integer "item_id"
    t.string "item_type"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "state"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "performers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "city"
    t.text "description"
    t.string "facebook"
    t.string "instagram"
    t.string "twitter"
    t.string "website"
    t.string "spotify"
    t.string "youtube"
    t.string "state"
  end

  create_table "performers_users", id: false, force: :cascade do |t|
    t.bigint "performer_id", null: false
    t.bigint "user_id", null: false
    t.index ["performer_id", "user_id"], name: "index_performers_users_on_performer_id_and_user_id"
  end

  create_table "sliders", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticket_variants", force: :cascade do |t|
    t.string "name"
    t.float "base_price_percentage"
    t.bigint "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sold_count", default: 0
    t.index ["ticket_id"], name: "index_ticket_variants_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.bigint "campaign_id"
    t.integer "count", default: 200
    t.integer "sold_count", default: 0
    t.index ["campaign_id"], name: "index_tickets_on_campaign_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaigns", "tickets", column: "tickets_id"
  add_foreign_key "campaigns", "users"
  add_foreign_key "event_tickets", "campaigns"
  add_foreign_key "event_tickets", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "ticket_variants", "tickets"
  add_foreign_key "tickets", "campaigns"
end
