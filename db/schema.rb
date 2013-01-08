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

ActiveRecord::Schema.define(:version => 20130108204149) do

  create_table "medias", :force => true do |t|
    t.string   "hashed_id"
    t.string   "name"
    t.float    "duration"
    t.text     "short_description"
    t.string   "thumbnail"
    t.datetime "created"
    t.integer  "project_id"
    t.float    "aspect_ratio"
    t.integer  "position"
    t.text     "long_description"
  end

  create_table "projects", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.string  "color"
    t.string  "hashed_id"
    t.integer "position"
  end

end
