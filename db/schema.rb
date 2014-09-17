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

ActiveRecord::Schema.define(version: 20140917151641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alphabets", force: true do |t|
    t.string "alphabet", null: false
  end

  add_index "alphabets", ["alphabet"], name: "index_alphabets_on_alphabet", unique: true, using: :btree

  create_table "consonants", force: true do |t|
    t.integer "alphabet_id",     null: false
    t.string  "consonant_class", null: false
  end

  add_index "consonants", ["alphabet_id", "consonant_class"], name: "index_consonants_on_alphabet_id_and_consonant_class", unique: true, using: :btree

end