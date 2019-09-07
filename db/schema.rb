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

ActiveRecord::Schema.define(version: 20170102135121) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

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
    t.string  "description"
    t.integer "stars",       default: 0
  end

  add_index "books", ["issue_date"], name: "index_books_on_issue_date", using: :btree
  add_index "books", ["language_id"], name: "index_books_on_language_id", using: :btree

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.string   "address"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.integer  "scale",                 default: 1
    t.integer  "frequency",             default: 1
    t.string   "url"
    t.string   "contact"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "clubs", ["country_id"], name: "index_clubs_on_country_id", using: :btree

  create_table "countries", force: true do |t|
    t.string  "name"
    t.integer "code"
    t.boolean "enabled"
    t.integer "region_id"
  end

  add_index "countries", ["enabled"], name: "index_countries_on_enabled", using: :btree
  add_index "countries", ["region_id"], name: "index_countries_on_region_id", using: :btree

  create_table "event_players", force: true do |t|
    t.integer "event_id"
    t.integer "player_id"
  end

  add_index "event_players", ["event_id"], name: "index_event_players_on_event_id", using: :btree
  add_index "event_players", ["player_id"], name: "index_event_players_on_player_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "country_id"
    t.string   "venue"
    t.string   "address"
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.string   "organizer"
    t.string   "url"
    t.string   "report_url"
    t.string   "contact"
    t.text     "description"
    t.integer  "category",               default: 0
    t.boolean  "canceled",               default: false
    t.integer  "scale",                  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "events", ["country_id"], name: "index_events_on_country_id", using: :btree
  add_index "events", ["start_time"], name: "index_events_on_start_time", using: :btree

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

  add_index "games", ["game_date"], name: "index_games_on_game_date", using: :btree
  add_index "games", ["gote_id"], name: "index_games_on_gote_id", using: :btree
  add_index "games", ["sente_id"], name: "index_games_on_sente_id", using: :btree
  add_index "games", ["tournament_id"], name: "index_games_on_tournament_id", using: :btree

  create_table "languages", force: true do |t|
    t.string  "name"
    t.integer "flag_code"
    t.boolean "enabled"
  end

  add_index "languages", ["enabled"], name: "index_languages_on_enabled", using: :btree

  create_table "news", force: true do |t|
    t.string   "entry_id"
    t.string   "url"
    t.datetime "published_at"
    t.string   "title_ja"
    t.string   "title_en"
    t.text     "content_ja"
    t.text     "content_en"
    t.integer  "category"
    t.boolean  "open",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "removed",      default: false
  end

  add_index "news", ["entry_id"], name: "index_news_on_entry_id", using: :btree
  add_index "news", ["published_at"], name: "index_news_on_published_at", using: :btree

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
    t.boolean  "retired",    default: false
    t.boolean  "deceased",   default: false
  end

  add_index "players", ["search_key"], name: "index_players_on_search_key", using: :btree

  create_table "regions", force: true do |t|
    t.string "name"
  end

  create_table "tournaments", force: true do |t|
    t.string "name"
    t.string "search_key"
  end

  add_index "tournaments", ["search_key"], name: "index_tournaments_on_search_key", using: :btree

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

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

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

  add_index "websites", ["country_id"], name: "index_websites_on_country_id", using: :btree
  add_index "websites", ["scale"], name: "index_websites_on_scale", using: :btree

end
