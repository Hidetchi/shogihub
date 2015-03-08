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

ActiveRecord::Schema.define(version: 20150307220841) do

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

  create_table "tournaments", force: true do |t|
    t.string "name"
    t.string "search_key"
  end

  add_index "tournaments", ["search_key"], name: "index_tournaments_on_search_key"

end
