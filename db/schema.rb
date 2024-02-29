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

ActiveRecord::Schema[7.1].define(version: 2024_02_23_122730) do
  create_table "chats", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sender_id"
    t.integer "recipient_id"
    t.index ["recipient_id"], name: "index_chats_on_recipient_id"
    t.index ["sender_id"], name: "index_chats_on_sender_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "comments_subjects", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "post_subjects_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "posts_subject_id"
    t.index ["post_subjects_id"], name: "index_comments_subjects_on_post_subjects_id"
    t.index ["user_id"], name: "index_comments_subjects_on_user_id"
  end

  create_table "group_chat_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_chat_id"], name: "index_group_chat_users_on_group_chat_id"
    t.index ["user_id"], name: "index_group_chat_users_on_user_id"
  end

  create_table "group_chatroom_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_chatroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_chatroom_id"], name: "index_group_chatroom_users_on_group_chatroom_id"
    t.index ["user_id"], name: "index_group_chatroom_users_on_user_id"
  end

  create_table "group_chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_chats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_group_chats_on_user_id"
  end

  create_table "group_chats_subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_group_chats_subjects_on_user_id"
  end

  create_table "group_chats_subjects_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_chat_subjects_id"
    t.index ["group_chat_subjects_id"], name: "index_group_chats_subjects_users_on_group_chat_subjects_id"
    t.index ["user_id"], name: "index_group_chats_subjects_users_on_user_id"
  end

  create_table "group_chats_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_chat_id"
    t.index ["group_chat_id"], name: "index_group_chats_users_on_group_chat_id"
    t.index ["user_id"], name: "index_group_chats_users_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "likes_subjects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_subjects_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_subjects_id"], name: "index_likes_subjects_on_post_subjects_id"
    t.index ["user_id"], name: "index_likes_subjects_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "messages_group_chatrooms", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "group_chatroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_chatroom_id"], name: "index_messages_group_chatrooms_on_group_chatroom_id"
    t.index ["user_id"], name: "index_messages_group_chatrooms_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "group_chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_chat_id"], name: "index_posts_on_group_chat_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "posts_subjects", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "group_chats_subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_chats_subject_id"], name: "index_posts_subjects_on_group_chats_subject_id"
    t.index ["user_id"], name: "index_posts_subjects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chats", "users"
  add_foreign_key "chats", "users", column: "recipient_id"
  add_foreign_key "chats", "users", column: "sender_id"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "comments_subjects", "post_subjects", column: "post_subjects_id"
  add_foreign_key "comments_subjects", "users"
  add_foreign_key "group_chat_users", "group_chats"
  add_foreign_key "group_chat_users", "users"
  add_foreign_key "group_chatroom_users", "group_chatrooms"
  add_foreign_key "group_chatroom_users", "users"
  add_foreign_key "group_chats_subjects", "users"
  add_foreign_key "group_chats_subjects_users", "group_chat_subjects", column: "group_chat_subjects_id"
  add_foreign_key "group_chats_subjects_users", "users"
  add_foreign_key "group_chats_users", "group_chats"
  add_foreign_key "group_chats_users", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "likes_subjects", "post_subjects", column: "post_subjects_id"
  add_foreign_key "likes_subjects", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "messages_group_chatrooms", "group_chatrooms"
  add_foreign_key "messages_group_chatrooms", "users"
  add_foreign_key "posts", "group_chats"
  add_foreign_key "posts", "users"
  add_foreign_key "posts_subjects", "group_chats_subjects"
  add_foreign_key "posts_subjects", "users"
end
