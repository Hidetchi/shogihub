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

ActiveRecord::Schema.define(version: 20190929114644) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "books", force: :cascade do |t|
    t.string  "isbn",        limit: 255
    t.integer "language_id", limit: 4
    t.string  "title",       limit: 255
    t.string  "author",      limit: 255
    t.string  "publisher",   limit: 255
    t.date    "issue_date"
    t.string  "translator",  limit: 255
    t.string  "url",         limit: 255
    t.string  "image_url",   limit: 255
    t.string  "category",    limit: 255
    t.string  "description", limit: 255
    t.integer "stars",       limit: 4,   default: 0
  end

  add_index "books", ["issue_date"], name: "index_books_on_issue_date", using: :btree
  add_index "books", ["language_id"], name: "index_books_on_language_id", using: :btree

  create_table "clubs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "country_id", limit: 4
    t.string   "address",    limit: 255
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.integer  "scale",      limit: 4,   default: 1
    t.integer  "frequency",  limit: 4,   default: 1
    t.string   "url",        limit: 255
    t.string   "contact",    limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id", limit: 4
    t.integer  "updater_id", limit: 4
  end

  add_index "clubs", ["country_id"], name: "index_clubs_on_country_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string  "name",      limit: 255
    t.integer "code",      limit: 4
    t.boolean "enabled"
    t.integer "region_id", limit: 4
  end

  add_index "countries", ["enabled"], name: "index_countries_on_enabled", using: :btree
  add_index "countries", ["region_id"], name: "index_countries_on_region_id", using: :btree

  create_table "event_players", force: :cascade do |t|
    t.integer "event_id",  limit: 4
    t.integer "player_id", limit: 4
  end

  add_index "event_players", ["event_id"], name: "index_event_players_on_event_id", using: :btree
  add_index "event_players", ["player_id"], name: "index_event_players_on_player_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "country_id",  limit: 4
    t.string   "venue",       limit: 255
    t.string   "address",     limit: 255
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.string   "organizer",   limit: 255
    t.string   "url",         limit: 255
    t.string   "report_url",  limit: 255
    t.string   "contact",     limit: 255
    t.text     "description", limit: 65535
    t.integer  "category",    limit: 4,     default: 0
    t.boolean  "canceled",                  default: false
    t.integer  "scale",       limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id",  limit: 4
    t.integer  "updater_id",  limit: 4
  end

  add_index "events", ["country_id"], name: "index_events_on_country_id", using: :btree
  add_index "events", ["start_time"], name: "index_events_on_start_time", using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "sente_id",      limit: 4
    t.integer  "gote_id",       limit: 4
    t.integer  "tournament_id", limit: 4
    t.string   "description",   limit: 255
    t.integer  "result",        limit: 4
    t.date     "game_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["game_date"], name: "index_games_on_game_date", using: :btree
  add_index "games", ["gote_id"], name: "index_games_on_gote_id", using: :btree
  add_index "games", ["sente_id"], name: "index_games_on_sente_id", using: :btree
  add_index "games", ["tournament_id"], name: "index_games_on_tournament_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string  "name",      limit: 255
    t.integer "flag_code", limit: 4
    t.boolean "enabled"
  end

  add_index "languages", ["enabled"], name: "index_languages_on_enabled", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer "news_id",      limit: 4
    t.integer "user_id",      limit: 4
    t.string  "anonymous_id", limit: 255
  end

  add_index "likes", ["anonymous_id"], name: "index_likes_on_anonymous_id", using: :btree
  add_index "likes", ["news_id"], name: "index_likes_on_news_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "entry_id",       limit: 255
    t.string   "url",            limit: 255
    t.datetime "published_at"
    t.string   "title_ja",       limit: 255
    t.string   "title_en",       limit: 255
    t.text     "content_ja",     limit: 65535
    t.text     "content_en",     limit: 65535
    t.integer  "category",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "instruction",    limit: 1,     default: 0
    t.integer  "status",         limit: 1,     default: 0
    t.integer  "translator_id",  limit: 4
    t.integer  "proofreader_id", limit: 4
  end

  add_index "news", ["entry_id"], name: "index_news_on_entry_id", using: :btree
  add_index "news", ["published_at"], name: "index_news_on_published_at", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "search_key", limit: 255
    t.integer  "category",   limit: 4,   default: 0
    t.integer  "kishi_id",   limit: 4
    t.integer  "rank",       limit: 4
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "retired",                default: false
    t.boolean  "deceased",               default: false
    t.string   "ancestry",   limit: 255
    t.integer  "alias_id",   limit: 4
  end

  add_index "players", ["search_key"], name: "index_players_on_search_key", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name",       limit: 255
    t.string "search_key", limit: 255
  end

  add_index "tournaments", ["search_key"], name: "index_tournaments_on_search_key", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "role",                   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.string   "url",                    limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "websites", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "url",                    limit: 255
    t.string   "owner",                  limit: 255
    t.string   "description",            limit: 255
    t.integer  "country_id",             limit: 4
    t.integer  "language_id",            limit: 4
    t.integer  "scale",                  limit: 4,   default: 0
    t.integer  "frequency",              limit: 4,   default: 0
    t.boolean  "contents_introduction"
    t.boolean  "contents_news_internal"
    t.boolean  "contents_news_external"
    t.boolean  "contents_forum"
    t.boolean  "contents_lesson"
    t.boolean  "contents_database"
    t.boolean  "contents_shop"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id",             limit: 4
    t.integer  "updater_id",             limit: 4
  end

  add_index "websites", ["country_id"], name: "index_websites_on_country_id", using: :btree
  add_index "websites", ["scale"], name: "index_websites_on_scale", using: :btree

end
