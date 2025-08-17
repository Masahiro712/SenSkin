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

ActiveRecord::Schema[7.1].define(version: 2025_08_17_110443) do
  create_table "lcomments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "lifestyle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lifestyle_id"], name: "index_lcomments_on_lifestyle_id"
    t.index ["user_id"], name: "index_lcomments_on_user_id"
  end

  create_table "lifestyle_ltag_relations", force: :cascade do |t|
    t.integer "lifestyle_id", null: false
    t.integer "ltag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lifestyle_id"], name: "index_lifestyle_ltag_relations_on_lifestyle_id"
    t.index ["ltag_id"], name: "index_lifestyle_ltag_relations_on_ltag_id"
  end

  create_table "lifestyles", force: :cascade do |t|
    t.string "title"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "user_id"
  end

  create_table "likeas", force: :cascade do |t|
    t.integer "lifestyle_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lifestyle_id"], name: "index_likeas_on_lifestyle_id"
    t.index ["user_id"], name: "index_likeas_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "review_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_likes_on_review_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "ltags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rcomments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_rcomments_on_review_id"
    t.index ["user_id"], name: "index_rcomments_on_user_id"
  end

  create_table "review_rtag_relations", force: :cascade do |t|
    t.integer "review_id", null: false
    t.integer "rtag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_review_rtag_relations_on_review_id"
    t.index ["rtag_id"], name: "index_review_rtag_relations_on_rtag_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "item"
    t.integer "price"
    t.text "url"
    t.text "comment"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "user_id"
  end

  create_table "rtags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.text "selfintroduction"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lcomments", "lifestyles"
  add_foreign_key "lcomments", "users"
  add_foreign_key "lifestyle_ltag_relations", "lifestyles"
  add_foreign_key "lifestyle_ltag_relations", "ltags"
  add_foreign_key "likeas", "lifestyles"
  add_foreign_key "likeas", "users"
  add_foreign_key "likes", "reviews"
  add_foreign_key "likes", "users"
  add_foreign_key "rcomments", "reviews"
  add_foreign_key "rcomments", "users"
  add_foreign_key "review_rtag_relations", "reviews"
  add_foreign_key "review_rtag_relations", "rtags"
end
