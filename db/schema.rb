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

ActiveRecord::Schema.define(:version => 20120406232129) do

  create_table "activities", :force => true do |t|
    t.integer  "person_id"
    t.integer  "activity_type"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "activities", ["person_id"], :name => "index_activities_on_person_id"
  add_index "activities", ["target_id", "target_type"], :name => "index_activities_on_target_id_and_target_type"

  create_table "activities_people", :force => true do |t|
    t.integer "activity_id"
    t.integer "person_id"
  end

  add_index "activities_people", ["activity_id"], :name => "index_activities_people_on_activity_id"
  add_index "activities_people", ["person_id"], :name => "index_activities_people_on_person_id"

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "person_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["person_id"], :name => "index_comments_on_person_id"

  create_table "items", :force => true do |t|
    t.string   "text"
    t.integer  "sharer_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "items", ["sharer_id"], :name => "index_items_on_sharer_id"

  create_table "people", :force => true do |t|
    t.string   "location"
    t.string   "short_desc"
    t.text     "desc"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sharages", :force => true do |t|
    t.integer  "person_id"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sharages", ["item_id"], :name => "index_sharages_on_item_id"
  add_index "sharages", ["person_id"], :name => "index_sharages_on_person_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "is_setup",   :default => false
    t.string   "image"
    t.string   "location"
  end

  create_table "wingmanships", :force => true do |t|
    t.integer  "person_id"
    t.integer  "wingman_id"
    t.boolean  "person_approved",  :default => true,  :null => false
    t.boolean  "wingman_approved", :default => false, :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "message"
  end

  add_index "wingmanships", ["person_id"], :name => "index_wingmanships_on_person_id"
  add_index "wingmanships", ["wingman_id"], :name => "index_wingmanships_on_wingman_id"

end
