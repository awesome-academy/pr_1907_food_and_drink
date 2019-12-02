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

ActiveRecord::Schema.define(version: 2019_12_02_123835) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id_id"
    t.integer "product_id_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id_id"], name: "index_comments_on_product_id_id"
    t.index ["user_id_id"], name: "index_comments_on_user_id_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id_id"], name: "index_orders_on_user_id_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer "product_id_id"
    t.integer "category_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id_id"], name: "index_product_categories_on_category_id_id"
    t.index ["product_id_id"], name: "index_product_categories_on_product_id_id"
  end

  create_table "product_orders", force: :cascade do |t|
    t.integer "order_id_id"
    t.integer "product_id_id"
    t.integer "quantity_id"
    t.integer "price_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id_id"], name: "index_product_orders_on_order_id_id"
    t.index ["price_id"], name: "index_product_orders_on_price_id"
    t.index ["product_id_id"], name: "index_product_orders_on_product_id_id"
    t.index ["quantity_id"], name: "index_product_orders_on_quantity_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price_id"
    t.string "image"
    t.string "description"
    t.string "status"
    t.string "product_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["price_id"], name: "index_products_on_price_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer "user_id_id"
    t.integer "product_id_id"
    t.string "star"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id_id"], name: "index_rates_on_product_id_id"
    t.index ["user_id_id"], name: "index_rates_on_user_id_id"
  end

  create_table "suggest_items", force: :cascade do |t|
    t.integer "user_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id_id"], name: "index_suggest_items_on_user_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "avatar"
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "activated"
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end