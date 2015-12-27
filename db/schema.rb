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

ActiveRecord::Schema.define(version: 20151006163032) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.string   "image",       limit: 255
    t.integer  "post_count",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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
    t.string   "first_name",  limit: 255
    t.string   "last_name",   limit: 255
    t.string   "email",       limit: 255
    t.string   "username",    limit: 255
    t.string   "password",    limit: 255
    t.boolean  "active_user"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "editor_id",     limit: 4
    t.text     "title",         limit: 65535
    t.string   "permalink",     limit: 255
    t.text     "content",       limit: 65535
    t.string   "image",         limit: 255
    t.text     "excerpt",       limit: 65535
    t.boolean  "visible",                     default: true
    t.string   "type",          limit: 255
    t.integer  "likes_count",   limit: 4
    t.integer  "comment_count", limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "posts", ["editor_id"], name: "index_posts_on_editor_id", using: :btree
  add_index "posts", ["permalink"], name: "index_posts_on_permalink", using: :btree

end
