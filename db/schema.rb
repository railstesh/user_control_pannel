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

ActiveRecord::Schema.define(version: 2021_10_14_133906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postcode"
    t.bigint "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "billings", force: :cascade do |t|
    t.integer "qty"
    t.string "currency"
    t.decimal "item_base_price"
    t.decimal "item_price"
    t.decimal "sub_total"
    t.decimal "discount_amount"
    t.decimal "tax_amount"
    t.decimal "grand_total"
    t.string "payment_method"
    t.bigint "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_billings_on_order_id"
  end

  create_table "categories", force: :cascade do |t|
    t.integer "primary_category_id"
    t.string "primary_category_name"
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_categories_on_product_id"
  end

  create_table "customers", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "group"
    t.bigint "address_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_customers_on_address_id"
  end

  create_table "leaf_categories", force: :cascade do |t|
    t.integer "leaf_category_id"
    t.string "leaf_category_name"
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_leaf_categories_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_id", null: false
    t.string "ref_order_no"
    t.date "purchase_date"
    t.string "status"
    t.string "coupon_code"
    t.bigint "product_id"
    t.bigint "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_id", null: false
    t.string "name", null: false
    t.string "sku", null: false
    t.decimal "weight"
    t.string "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "revenues", force: :cascade do |t|
    t.integer "total_order"
    t.decimal "total_revenue"
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_revenues_on_product_id"
  end

  create_table "secondary_categories", force: :cascade do |t|
    t.integer "secondary_category_id"
    t.string "secondary_category_name"
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_secondary_categories_on_product_id"
  end

  create_table "shippings", force: :cascade do |t|
    t.decimal "shipping_amount"
    t.string "shipping_method"
    t.date "region_date"
    t.bigint "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_shippings_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "role", default: 0
    t.string "google_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
