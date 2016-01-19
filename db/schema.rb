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

ActiveRecord::Schema.define(version: 20160119040035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "cost"
    t.string   "skill_level"
    t.string   "url"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.date     "course_created"
    t.float    "average_rating", default: 0.0
    t.string   "price"
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id", using: :btree

  create_table "curriculums", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "skill_level"
  end

  add_index "curriculums", ["user_id"], name: "index_curriculums_on_user_id", using: :btree

  create_table "language_courses", force: :cascade do |t|
    t.integer  "language_id"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "language_courses", ["course_id"], name: "index_language_courses_on_course_id", using: :btree
  add_index "language_courses", ["language_id"], name: "index_language_courses_on_language_id", using: :btree

  create_table "language_curriculums", force: :cascade do |t|
    t.integer  "language_id"
    t.integer  "curriculum_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "language_curriculums", ["curriculum_id"], name: "index_language_curriculums_on_curriculum_id", using: :btree
  add_index "language_curriculums", ["language_id"], name: "index_language_curriculums_on_language_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.integer  "position"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "curriculum_id"
    t.string   "cost"
  end

  add_index "posts", ["curriculum_id"], name: "index_posts_on_curriculum_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.integer  "rating"
    t.text     "review_body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "course_id"
    t.integer  "user_id"
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "about"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "courses", "users"
  add_foreign_key "curriculums", "users"
  add_foreign_key "language_courses", "courses"
  add_foreign_key "language_courses", "languages"
  add_foreign_key "language_curriculums", "curriculums"
  add_foreign_key "language_curriculums", "languages"
  add_foreign_key "posts", "curriculums"
  add_foreign_key "reviews", "users"
end
