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

ActiveRecord::Schema.define(version: 20160114092205) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "post_count",         limit: 4,     default: 0
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "categories_editors", id: false, force: :cascade do |t|
    t.integer "category_id", limit: 4
    t.integer "editor_id",   limit: 4
  end

  add_index "categories_editors", ["category_id", "editor_id"], name: "index_categories_editors_on_category_id_and_editor_id", using: :btree

  create_table "categories_posts", id: false, force: :cascade do |t|
    t.integer "category_id", limit: 4
    t.integer "post_id",     limit: 4
  end

  add_index "categories_posts", ["category_id", "post_id"], name: "index_categories_posts_on_category_id_and_post_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.integer  "editor_id",  limit: 4
    t.text     "content",    limit: 65535
    t.boolean  "approved",                 default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "comments", ["editor_id"], name: "index_comments_on_editor_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "editors", force: :cascade do |t|
    t.string   "first_name",               limit: 255
    t.string   "last_name",                limit: 255
    t.string   "user_avatar_file_name",    limit: 255
    t.string   "user_avatar_content_type", limit: 255
    t.integer  "user_avatar_file_size",    limit: 4
    t.datetime "user_avatar_updated_at"
    t.string   "nickname",                 limit: 255
    t.boolean  "active_user"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "email",                    limit: 255, default: "", null: false
    t.string   "encrypted_password",       limit: 255, default: "", null: false
    t.string   "reset_password_token",     limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",       limit: 255
    t.string   "last_sign_in_ip",          limit: 255
    t.string   "confirmation_token",       limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",        limit: 255
    t.integer  "failed_attempts",          limit: 4,   default: 0,  null: false
    t.string   "unlock_token",             limit: 255
    t.datetime "locked_at"
  end

  add_index "editors", ["confirmation_token"], name: "index_editors_on_confirmation_token", unique: true, using: :btree
  add_index "editors", ["email"], name: "index_editors_on_email", unique: true, using: :btree
  add_index "editors", ["reset_password_token"], name: "index_editors_on_reset_password_token", unique: true, using: :btree
  add_index "editors", ["unlock_token"], name: "index_editors_on_unlock_token", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "editor_id",          limit: 4
    t.text     "title",              limit: 65535
    t.text     "content",            limit: 65535
    t.text     "excerpt",            limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.boolean  "visible",                          default: true
    t.string   "post_type",          limit: 255
    t.integer  "likes_count",        limit: 4,     default: 0
    t.integer  "comment_count",      limit: 4,     default: 0
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "posts", ["editor_id"], name: "index_posts_on_editor_id", using: :btree

end
