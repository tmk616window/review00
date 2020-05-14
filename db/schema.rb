# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_12_121027) do

  create_table "channels", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "task_id"
  end

  create_table "chats", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "task_id"
    t.integer "channel_id"
    t.integer "chat_post_id"
    t.string "chat_email"
    t.index ["channel_id"], name: "index_chats_on_channel_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "follower_id"
    t.integer "user_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "follow_user_email"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_id"], name: "index_likes_on_task_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "name"
    t.string "date"
    t.text "message_coment"
    t.string "image"
    t.string "message_place"
    t.integer "people"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "message_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "post_name"
    t.text "post_content"
    t.integer "post_old"
    t.string "post_job"
    t.string "post_email"
    t.integer "post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "post_sex"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_user_email"
    t.text "design"
    t.integer "design_point"
    t.text "function"
    t.integer "function_point"
    t.text "plan"
    t.integer "plam_point"
    t.text "unique"
    t.integer "unique_point"
    t.text "user_perspective"
    t.integer "user_perspective_point"
    t.string "recruit"
    t.string "field"
    t.integer "task_old"
    t.string "task_pl"
    t.string "task_tool"
    t.string "github_url"
    t.text "work_explain"
    t.integer "study_period"
    t.string "company_info"
    t.text "task_coment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "coment"
    t.integer "old"
    t.string "programing_language"
    t.string "job_past"
    t.string "name"
    t.string "icon"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chats", "channels"
  add_foreign_key "chats", "users"
  add_foreign_key "likes", "tasks"
  add_foreign_key "likes", "users"
  add_foreign_key "tasks", "users"
end
