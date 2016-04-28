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

ActiveRecord::Schema.define(version: 20160428101452) do

  create_table "telegram_bot_rails_bots", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "token",                                            null: false
    t.string   "responder_name", default: "application_responder", null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "telegram_bot_rails_bots", ["token"], name: "index_telegram_bot_rails_bots_on_token"

  create_table "telegram_bot_rails_conversations", force: :cascade do |t|
    t.integer  "chat_id"
    t.integer  "bot_id"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "telegram_bot_rails_conversations", ["bot_id"], name: "index_telegram_bot_rails_conversations_on_bot_id"

end
