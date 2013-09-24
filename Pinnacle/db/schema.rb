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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130325002519) do

  create_table "events", :force => true do |t|
    t.datetime "event_date_time_GMT"
    t.integer  "game_number"
    t.string   "sport_type"
    t.string   "leage"
    t.boolean  "is_live"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "participants", :force => true do |t|
    t.string   "participant_name"
    t.integer  "contestantnum"
    t.integer  "rotnum"
    t.string   "visiting_home_draw"
    t.integer  "event_game_number"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "periods", :force => true do |t|
    t.integer  "period_number"
    t.string   "period_description"
    t.datetime "period_cutoff_datetimeGMT"
    t.string   "period_status"
    t.string   "period_update"
    t.decimal  "spread_maximum"
    t.decimal  "moneyline_maximum"
    t.decimal  "total_maximum"
    t.integer  "event_game_number"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "pinnacle_feeds", :force => true do |t|
    t.integer  "pinnacle_feed_time"
    t.integer  "last_contest"
    t.integer  "last_game"
    t.string   "sport_type"
    t.string   "sport_sub_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
