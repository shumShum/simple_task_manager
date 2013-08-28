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

ActiveRecord::Schema.define(:version => 20130821093125) do

  create_table "stories", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "assigner_id"
    t.integer  "assignee_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "state"
    t.string   "pic"
  end

  add_index "stories", ["assignee_id"], :name => "index_stories_on_child_id"
  add_index "stories", ["assigner_id"], :name => "index_stories_on_parent_id"

  create_table "story_comments", :force => true do |t|
    t.integer  "story_id"
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ancestry"
  end

  add_index "story_comments", ["ancestry"], :name => "index_story_comments_on_ancestry"
  add_index "story_comments", ["story_id"], :name => "index_story_comments_on_story_id"
  add_index "story_comments", ["user_id"], :name => "index_story_comments_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "email"
    t.string   "password_digest"
  end

end
