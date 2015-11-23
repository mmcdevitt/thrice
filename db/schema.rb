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

ActiveRecord::Schema.define(version: 20151123172309) do

  create_table "carts", force: true do |t|
    t.integer  "order_status_id"
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "tax",             precision: 12, scale: 3
    t.decimal  "shipping",        precision: 12, scale: 3
    t.decimal  "total",           precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "listing_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: true do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listing_images", force: true do |t|
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "listing_image_file_name"
    t.string   "listing_image_content_type"
    t.integer  "listing_image_file_size"
    t.datetime "listing_image_updated_at"
  end

  create_table "listings", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "active",                                  default: true
    t.boolean  "sold",                                    default: false
    t.integer  "category_id"
    t.string   "designer_name"
    t.integer  "size_id"
    t.string   "color"
    t.boolean  "tags_attached"
    t.boolean  "wear_and_tear"
    t.decimal  "selling_price",  precision: 12, scale: 3
    t.boolean  "published"
    t.integer  "option_id"
    t.integer  "option_item_id"
    t.boolean  "best_offer"
  end

  create_table "option_items", force: true do |t|
    t.string   "value"
    t.integer  "option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "options", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "listing_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seller_id"
    t.integer  "cart_id"
    t.integer  "order_id"
  end

  add_index "order_items", ["listing_id"], name: "index_order_items_on_listing_id"

  create_table "order_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "buyer_id"
    t.integer  "order_status_id"
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "tax",             precision: 12, scale: 3
    t.decimal  "shipping",        precision: 12, scale: 3
    t.decimal  "total",           precision: 12, scale: 3
    t.string   "first_name"
    t.string   "last_name"
    t.string   "second_address"
    t.string   "zipcode"
    t.string   "phone_number"
    t.string   "cc_name"
    t.string   "cc_number"
    t.string   "expiry_month"
    t.string   "expiry_year"
    t.string   "cc_cvv"
  end

  create_table "ratings", force: true do |t|
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.integer  "listing_id"
    t.integer  "feedback_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.integer  "order_id"
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.decimal  "subtotal",   precision: 12, scale: 3
    t.decimal  "total",      precision: 12, scale: 3
    t.boolean  "payout",                              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "listing_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "recipient"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "shipping_address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "watchers", force: true do |t|
    t.integer  "listing_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
