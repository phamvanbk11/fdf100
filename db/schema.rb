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

ActiveRecord::Schema.define(version: 20160915081012) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_categories_on_deleted_at", using: :btree
    t.index ["name"], name: "index_categories_on_name", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",          limit: 65535
    t.integer  "user_id"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
    t.index ["deleted_at"], name: "index_comments_on_deleted_at", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "coupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",   limit: 65535
    t.integer  "coupon_type"
    t.integer  "discount_type"
    t.integer  "value"
    t.string   "code"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "shop_id"
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["deleted_at"], name: "index_coupons_on_deleted_at", using: :btree
    t.index ["name"], name: "index_coupons_on_name", using: :btree
    t.index ["shop_id", "user_id"], name: "index_coupons_on_shop_id_and_user_id", using: :btree
    t.index ["shop_id"], name: "index_coupons_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_coupons_on_user_id", using: :btree
  end

  create_table "oder_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "quantity"
    t.float    "price",      limit: 24
    t.text     "notes",      limit: 65535
    t.integer  "user_id"
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "coupon_id"
    t.datetime "deleted_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["coupon_id"], name: "index_oder_products_on_coupon_id", using: :btree
    t.index ["deleted_at"], name: "index_oder_products_on_deleted_at", using: :btree
    t.index ["order_id", "product_id"], name: "index_oder_products_on_order_id_and_product_id", using: :btree
    t.index ["order_id"], name: "index_oder_products_on_order_id", using: :btree
    t.index ["product_id"], name: "index_oder_products_on_product_id", using: :btree
    t.index ["user_id"], name: "index_oder_products_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "status"
    t.datetime "end_at"
    t.text     "notes",      limit: 65535
    t.integer  "user_id"
    t.integer  "shop_id"
    t.integer  "coupon_id"
    t.datetime "deleted_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["coupon_id"], name: "index_orders_on_coupon_id", using: :btree
    t.index ["deleted_at"], name: "index_orders_on_deleted_at", using: :btree
    t.index ["shop_id", "user_id"], name: "index_orders_on_shop_id_and_user_id", using: :btree
    t.index ["shop_id"], name: "index_orders_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.float    "price",       limit: 24
    t.string   "image"
    t.integer  "status"
    t.integer  "category_id"
    t.integer  "shop_id"
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["deleted_at"], name: "index_products_on_deleted_at", using: :btree
    t.index ["name"], name: "index_products_on_name", using: :btree
    t.index ["shop_id", "user_id"], name: "index_products_on_shop_id_and_user_id", using: :btree
    t.index ["shop_id"], name: "index_products_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "rating",          limit: 24
    t.string   "review"
    t.integer  "user_id"
    t.string   "reviewable_type"
    t.integer  "reviewable_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["deleted_at"], name: "index_reviews_on_deleted_at", using: :btree
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "shop_managers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.integer  "role",       default: 0
    t.datetime "deleted_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["deleted_at"], name: "index_shop_managers_on_deleted_at", using: :btree
    t.index ["shop_id", "user_id"], name: "index_shop_managers_on_shop_id_and_user_id", using: :btree
    t.index ["shop_id"], name: "index_shop_managers_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_shop_managers_on_user_id", using: :btree
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",    limit: 65535
    t.integer  "status"
    t.string   "cover_image"
    t.string   "avatar"
    t.float    "averate_rating", limit: 24
    t.datetime "deleted_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["deleted_at"], name: "index_shops_on_deleted_at", using: :btree
  end

  create_table "tag_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "tag_id"
    t.integer  "product_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_tag_products_on_deleted_at", using: :btree
    t.index ["product_id"], name: "index_tag_products_on_product_id", using: :btree
    t.index ["tag_id", "product_id"], name: "index_tag_products_on_tag_id_and_product_id", using: :btree
    t.index ["tag_id"], name: "index_tag_products_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_tags_on_deleted_at", using: :btree
    t.index ["name"], name: "index_tags_on_name", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "avatar"
    t.string   "chatwork_id"
    t.string   "description"
    t.datetime "deleted_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "users"
  add_foreign_key "coupons", "shops"
  add_foreign_key "coupons", "users"
  add_foreign_key "oder_products", "coupons"
  add_foreign_key "oder_products", "orders"
  add_foreign_key "oder_products", "products"
  add_foreign_key "oder_products", "users"
  add_foreign_key "orders", "coupons"
  add_foreign_key "orders", "shops"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "shops"
  add_foreign_key "products", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "shop_managers", "shops"
  add_foreign_key "shop_managers", "users"
  add_foreign_key "tag_products", "products"
  add_foreign_key "tag_products", "tags"
end