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

ActiveRecord::Schema.define(:version => 20110101233058) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id",                         :null => false
    t.string   "text",             :limit => 400, :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], :name => "user_id"

  create_table "entries", :force => true do |t|
    t.integer  "entrytype_id", :null => false
    t.integer  "feedback_id",  :null => false
    t.integer  "user_id",      :null => false
    t.text     "description"
    t.integer  "rating",       :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "entries", ["entrytype_id"], :name => "entrytype_id"
  add_index "entries", ["feedback_id"], :name => "feedback_id"
  add_index "entries", ["user_id"], :name => "user_id"

  create_table "entrytypes", :force => true do |t|
    t.string "name",    :limit => 50, :null => false
    t.text   "comment"
  end

  create_table "feedbackproperties", :id => false, :force => true do |t|
    t.integer  "id",                                                           :default => 0,  :null => false
    t.decimal  "rating",                        :precision => 11, :scale => 0, :default => 0,  :null => false
    t.string   "address",                                                                      :null => false
    t.string   "postcode",        :limit => 50,                                :default => "", :null => false
    t.decimal  "lat",                           :precision => 11, :scale => 7,                 :null => false
    t.decimal  "lng",                           :precision => 11, :scale => 7,                 :null => false
    t.integer  "propertytype_id",                                                              :null => false
    t.datetime "updated_at"
    t.integer  "user_id",                                                                      :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "property_id",                              :null => false
    t.integer  "user_id",                                  :null => false
    t.integer  "totalmonths",               :default => 6, :null => false
    t.date     "lastdate"
    t.string   "landlord",    :limit => 50,                :null => false
    t.string   "agency",      :limit => 50,                :null => false
    t.boolean  "anonymous",                                :null => false
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "feedbacks", ["property_id"], :name => "property_id"
  add_index "feedbacks", ["user_id"], :name => "user_id"

  create_table "photos", :force => true do |t|
    t.integer  "feedback_id",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "photos", ["feedback_id"], :name => "feedback_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "entry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.integer  "propertytype_id",                                              :null => false
    t.string   "address",                                                      :null => false
    t.integer  "user_id",                                                      :null => false
    t.string   "postcode",        :limit => 50,                                :null => false
    t.decimal  "lat",                           :precision => 11, :scale => 7, :null => false
    t.decimal  "lng",                           :precision => 11, :scale => 7, :null => false
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "properties", ["lat"], :name => "lat"
  add_index "properties", ["lng"], :name => "lng"
  add_index "properties", ["propertytype_id"], :name => "propertytype_id"
  add_index "properties", ["user_id"], :name => "user_id"

  create_table "propertytypes", :force => true do |t|
    t.string "name",    :limit => 50, :null => false
    t.text   "comment",               :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "alias",      :limit => 16, :null => false
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["alias"], :name => "alias", :unique => true

end
