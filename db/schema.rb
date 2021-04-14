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

ActiveRecord::Schema.define(version: 2021_04_14_070117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.string "popular_model_type"
    t.bigint "popular_model_id"
    t.string "friend_type"
    t.bigint "friend_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend_id", "friend_type"], name: "index_friendships_on_friend_id_and_friend_type"
    t.index ["friend_type", "friend_id"], name: "index_friendships_on_friend"
    t.index ["popular_model_id", "popular_model_type"], name: "index_friendships_on_popular_model_id_and_popular_model_type"
    t.index ["popular_model_type", "popular_model_id"], name: "index_friendships_on_popular_model"
  end

  create_table "headings", force: :cascade do |t|
    t.integer "member_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name", null: false
    t.string "website_url", null: false
    t.string "short_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
