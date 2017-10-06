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

ActiveRecord::Schema.define(version: 20171003082639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "line_1", null: false
    t.string "line_2"
    t.string "country", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.string "addressable_type"
    t.integer "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "item_code"
    t.string "cover_slip"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "mob_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.string "title"
    t.string "department"
    t.string "fax"
  end

  create_table "counties", force: :cascade do |t|
    t.integer "state_id"
    t.string "abbr"
    t.string "name"
    t.string "county_seat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_counties_on_name"
    t.index ["state_id"], name: "index_counties_on_state_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.string "phone_number"
    t.string "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity", null: false
    t.bigint "order_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount", null: false
    t.decimal "unit_price", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_number", null: false
    t.string "description", null: false
    t.bigint "customer_id"
    t.bigint "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "ordered_at"
    t.integer "status", default: 0, null: false
    t.decimal "total_amount"
    t.index ["contact_id"], name: "index_orders_on_contact_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.decimal "price", precision: 10, scale: 5, null: false
    t.integer "stock_in_hand", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "abbr", limit: 2
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abbr"], name: "index_states_on_abbr"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.bigint "customer_id"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "off_phone"
    t.string "mob_no"
    t.string "department"
    t.string "department_phone"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.integer "invited_by_id"
    t.string "invited_by_type"
    t.index ["customer_id"], name: "index_users_on_customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zipcodes", force: :cascade do |t|
    t.string "code"
    t.string "city"
    t.integer "state_id"
    t.integer "county_id"
    t.string "area_code"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lon", precision: 15, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_zipcodes_on_code"
    t.index ["county_id"], name: "index_zipcodes_on_county_id"
    t.index ["lat", "lon"], name: "index_zipcodes_on_lat_and_lon"
    t.index ["state_id"], name: "index_zipcodes_on_state_id"
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "contacts"
  add_foreign_key "orders", "customers"
  add_foreign_key "products", "categories"
end
