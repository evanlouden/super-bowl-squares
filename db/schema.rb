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

ActiveRecord::Schema[7.1].define(version: 2025_01_10_230333) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "share_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", default: 1, null: false
    t.boolean "locked", default: false
    t.integer "square_price", null: false
    t.integer "first_quarter_payout", null: false
    t.integer "second_quarter_payout", null: false
    t.integer "third_quarter_payout", null: false
    t.integer "final_payout", null: false
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

  create_table "payments", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "user_id", null: false
    t.integer "amount", null: false
    t.boolean "paid_in", default: false, null: false
    t.boolean "paid_out", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_payments_on_game_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "x_axis_score", null: false
    t.integer "y_axis_score", null: false
    t.string "quarter", null: false
    t.boolean "final", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "users"
  add_foreign_key "headers", "games"
  add_foreign_key "payments", "games"
  add_foreign_key "payments", "users"
  add_foreign_key "squares", "games"
  add_foreign_key "squares", "users"
end
