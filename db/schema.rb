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

ActiveRecord::Schema.define(version: 20150917223157) do

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

  create_table "images", force: true do |t|
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "listings", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.boolean  "active",                                      default: true
    t.boolean  "sold",                                        default: false
    t.integer  "category_id"
    t.string   "designer_name"
    t.integer  "size_id"
    t.string   "color"
    t.boolean  "tags_attached"
    t.boolean  "wear_and_tear"
    t.decimal  "selling_price",      precision: 12, scale: 3
    t.boolean  "published"
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

  create_table "transactions", force: true do |t|
    t.integer  "order_id"
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.decimal  "subtotal",      precision: 12, scale: 3
    t.decimal  "total",         precision: 12, scale: 3
    t.boolean  "payout",                                 default: false
    t.integer  "order_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "recipient"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
