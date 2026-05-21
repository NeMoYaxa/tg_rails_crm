ActiveRecord::Schema[8.1].define(version: 2026_05_21_150234) do
  enable_extension "pg_catalog.plpgsql"

  create_table "bot_logs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "message_text", null: false
    t.bigint "telegram_user_id", null: false
    t.datetime "updated_at", null: false
    t.index ["telegram_user_id"], name: "index_bot_logs_on_telegram_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
    t.check_constraint "quantity > 0", name: "quantity_positive"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "status", null: false
    t.bigint "telegram_user_id", null: false
    t.decimal "total_price", precision: 10, scale: 2, null: false
    t.datetime "updated_at", null: false
    t.index ["telegram_user_id"], name: "index_orders_on_telegram_user_id"
    t.check_constraint "total_price > 0::numeric", name: "total_price_positive"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "price > 0::numeric", name: "price_positive"
  end

  create_table "telegram_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "first_name", null: false
    t.string "step"
    t.bigint "telegram_id", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["telegram_id"], name: "index_telegram_users_on_telegram_id", unique: true
  end

  add_foreign_key "bot_logs", "telegram_users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "telegram_users"
end
