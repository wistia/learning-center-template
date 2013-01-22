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

ActiveRecord::Schema.define(:version => 20130122154934) do

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
    t.boolean  "is_current"
  end

  create_table "projects", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.string  "color"
    t.string  "hashed_id"
    t.integer "position"
    t.boolean "is_current"
  end

  create_table "slugs", :force => true do |t|
    t.string  "hashed_id",                        :null => false
    t.string  "key",                              :null => false
    t.string  "resource_type",                    :null => false
    t.boolean "active",        :default => false, :null => false
  end

  add_index "slugs", ["hashed_id"], :name => "index_slugs_on_hashed_id"
  add_index "slugs", ["key"], :name => "index_slugs_on_key", :unique => true
  add_index "slugs", ["resource_type"], :name => "index_slugs_on_resource_type"

end
