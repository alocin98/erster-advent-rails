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

ActiveRecord::Schema[8.0].define(version: 2025_10_07_094014) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pg_trgm"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "business_name", null: false
    t.string "phone", null: false
    t.text "address", null: false
    t.text "billing_address", null: false
    t.string "main_image"
    t.string "image_gallery1"
    t.string "image_gallery2"
    t.string "image_gallery3"
    t.text "map_link", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirmed", default: false, null: false
    t.jsonb "categories", default: [], null: false
    t.string "contact_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "website", default: "", null: false
    t.string "first_advent_specialities", default: [], array: true
    t.string "instagram", default: "", null: false
    t.string "tiktok", default: "", null: false
    t.string "linkedin", default: "", null: false
    t.string "facebook", default: "", null: false
    t.integer "status", default: 0
    t.index ["categories"], name: "index_businesses_on_categories", using: :gin
    t.index ["confirmed"], name: "index_businesses_on_confirmed"
    t.index ["status"], name: "index_businesses_on_status"
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "cms_blocks", force: :cascade do |t|
    t.string "page", null: false
    t.integer "position", null: false
    t.integer "block_type", null: false
    t.boolean "is_active", default: true, null: false
    t.string "button_url"
    t.string "button_text"
    t.text "question"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "id_of_user", null: false
    t.integer "quantity", null: false
    t.string "size", null: false
    t.string "order_no", null: false
    t.string "accept_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id_of_user"], name: "index_orders_on_id_of_user"
    t.index ["product_id"], name: "index_orders_on_product_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "payment_image", null: false
    t.string "payment_session_id"
    t.string "customer_email"
    t.string "plan"
    t.string "is_verified", default: "Pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.string "main_product_image", null: false
    t.jsonb "images_of_product", null: false
    t.jsonb "sizes", null: false
    t.string "delievry_time", null: false
    t.integer "total_orders", default: 0, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.string "business_name"
    t.text "address"
    t.string "management_name"
    t.string "phone"
    t.string "category"
    t.integer "package_plan"
    t.string "otp"
    t.boolean "is_verified", default: false, null: false
    t.datetime "otp_expiration_time"
    t.string "payment_method"
    t.string "legacy_password_hash"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "deleted", default: false, null: false
    t.index "to_tsvector('simple'::regconfig, (COALESCE(email, ''::character varying))::text)", name: "users_search_idx", using: :gin
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted"], name: "index_users_on_deleted"
    t.index ["email"], name: "index_users_on_email", opclass: :gin_trgm_ops, using: :gin
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "businesses", "users"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "users", column: "id_of_user"
  add_foreign_key "payments", "users"
  add_foreign_key "products", "users"
end
