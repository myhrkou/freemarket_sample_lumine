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

ActiveRecord::Schema.define(version: 20200205091050) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "zip",        null: false
    t.string   "prefecture", null: false
    t.string   "city",       null: false
    t.string   "number",     null: false
    t.string   "building"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "customer_id", null: false
    t.string   "card_id",     null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                             null: false
    t.text     "description",            limit: 65535,             null: false
    t.string   "condition",                                        null: false
    t.string   "delivery_charge_detail",                           null: false
    t.integer  "delivery_origin_id",                               null: false
    t.string   "delivery_date",                                    null: false
    t.string   "price",                                            null: false
    t.integer  "user_id",                                          null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "status",                               default: 0
    t.integer  "buyer"
    t.integer  "category_id_id"
    t.integer  "category_id"
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["category_id_id"], name: "index_items_on_category_id_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "items_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image_url",  null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_items_images_on_item_id", using: :btree
  end

  create_table "sns_credentials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sns_credentials_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "yomi_first_name",                     null: false
    t.string   "yomi_last_name",                      null: false
    t.date     "birth_day",                           null: false
    t.string   "phone_number"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image"
    t.string   "content"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cards", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
  add_foreign_key "items_images", "items"
  add_foreign_key "sns_credentials", "users"
end
