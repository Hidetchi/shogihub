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

ActiveRecord::Schema.define(version: 20150329164919) do

  create_table "books", force: true do |t|
    t.string  "isbn"
    t.integer "language_id"
    t.string  "title"
    t.string  "author"
    t.string  "publisher"
    t.date    "issue_date"
    t.string  "translator"
    t.string  "url"
    t.string  "image_url"
    t.string  "category"
    t.text    "description"
    t.integer "stars",       default: 0
  end

  add_index "books", ["issue_date"], name: "index_books_on_issue_date"
  add_index "books", ["language_id"], name: "index_books_on_language_id"

  create_table "countries", force: true do |t|
    t.string  "name"
    t.integer "code"
    t.boolean "enabled"
    t.integer "region_id"
  end

  add_index "countries", ["enabled"], name: "index_countries_on_enabled"
  add_index "countries", ["region_id"], name: "index_countries_on_region_id"

  create_table "event_players", force: true do |t|
    t.integer "event_id"
    t.integer "player_id"
  end

  add_index "event_players", ["event_id"], name: "index_event_players_on_event_id"
  add_index "event_players", ["player_id"], name: "index_event_players_on_player_id"

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "country_id"
    t.string   "venue"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "organizer"
    t.string   "url"
    t.string   "report_url"
    t.string   "contact"
    t.text     "description"
    t.integer  "category"
    t.boolean  "canceled"
    t.integer  "scale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "events", ["country_id"], name: "index_events_on_country_id"
  add_index "events", ["start_time"], name: "index_events_on_start_time"

  create_table "games", force: true do |t|
    t.integer  "sente_id"
    t.integer  "gote_id"
    t.integer  "tournament_id"
    t.string   "description"
    t.integer  "result"
    t.date     "game_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["game_date"], name: "index_games_on_game_date"
  add_index "games", ["gote_id"], name: "index_games_on_gote_id"
  add_index "games", ["sente_id"], name: "index_games_on_sente_id"
  add_index "games", ["tournament_id"], name: "index_games_on_tournament_id"

  create_table "languages", force: true do |t|
    t.string  "name"
    t.integer "flag_code"
    t.boolean "enabled"
  end

  add_index "languages", ["enabled"], name: "index_languages_on_enabled"

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "search_key"
    t.integer  "category",   default: 0
    t.integer  "kishi_id"
    t.integer  "teacher_id"
    t.integer  "rank"
    t.date     "birthday"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
  end

  add_index "players", ["search_key"], name: "index_players_on_search_key"

  create_table "regions", force: true do |t|
    t.string "name"
  end

  create_table "tournaments", force: true do |t|
    t.string "name"
    t.string "search_key"
  end

  add_index "tournaments", ["search_key"], name: "index_tournaments_on_search_key"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "websites", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "owner"
    t.string   "description"
    t.integer  "country_id"
    t.integer  "language_id"
    t.integer  "scale",                  default: 0
    t.integer  "frequency",              default: 0
    t.boolean  "contents_introduction"
    t.boolean  "contents_news_internal"
    t.boolean  "contents_news_external"
    t.boolean  "contents_forum"
    t.boolean  "contents_lesson"
    t.boolean  "contents_database"
    t.boolean  "contents_shop"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "websites", ["country_id"], name: "index_websites_on_country_id"
  add_index "websites", ["scale"], name: "index_websites_on_scale"

end
