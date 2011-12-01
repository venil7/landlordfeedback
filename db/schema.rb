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

ActiveRecord::Schema.define(:version => 20111123225216) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_notes", :force => true do |t|
    t.integer  "resource_id",     :null => false
    t.string   "resource_type",   :null => false
    t.integer  "admin_user_id"
    t.string   "admin_user_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_notes", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

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
    t.string   "alias",                              :null => false
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",   :default => "facebook"
  end

  add_index "users", ["alias"], :name => "alias", :unique => true

end
