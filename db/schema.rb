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

ActiveRecord::Schema[7.1].define(version: 2024_09_14_202704) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "share_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", default: 1, null: false
    t.boolean "locked", default: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "headers", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "axis"
    t.integer "position"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_headers_on_game_id"
  end

  create_table "squares", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.integer "x"
    t.integer "y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["game_id"], name: "index_squares_on_game_id"
    t.index ["user_id"], name: "index_squares_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "users"
  add_foreign_key "headers", "games"
  add_foreign_key "squares", "games"
  add_foreign_key "squares", "users"
end
