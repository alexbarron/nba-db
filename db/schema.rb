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

ActiveRecord::Schema.define(version: 20160429230853) do

  create_table "games", primary_key: "game_id", force: :cascade do |t|
    t.integer  "home_id"
    t.integer  "away_id"
    t.string   "season"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "home_score"
    t.integer  "away_score"
    t.integer  "winner"
    t.integer  "loser"
  end

  create_table "players", primary_key: "player_id", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "birthdate"
    t.string   "position"
  end

  add_index "players", ["player_id"], name: "index_players_on_player_id", unique: true

  create_table "teams", primary_key: "team_id", force: :cascade do |t|
    t.string   "city"
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "teams", ["team_id"], name: "index_teams_on_team_id", unique: true

end
