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

ActiveRecord::Schema.define(:version => 20110527200846) do

  create_table "badges", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isActive",    :default => true
  end

  create_table "barista", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorite_shops", :force => true do |t|
    t.integer  "shop_id"
    t.integer  "user_id"
    t.boolean  "isActive",   :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "image_stores", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_type"
    t.string   "filename"
    t.binary   "binary_data"
  end

  create_table "photos", :force => true do |t|
    t.string   "file_name"
    t.string   "content_type"
    t.integer  "file_size"
    t.integer  "user_id"
    t.integer  "barista_id"
    t.integer  "review_id"
    t.integer  "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationtype", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isActive",    :default => true
  end

  create_table "reviews", :force => true do |t|
    t.integer  "shop_id"
    t.integer  "user_id"
    t.string   "description"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "CappuccinoScore"
    t.float    "EspressoScore"
    t.float    "PersonalityScore"
    t.float    "AtmosphereScore"
    t.boolean  "isActive",         :default => true
    t.float    "DripScore"
    t.integer  "photo_id"
    t.integer  "barista_id"
    t.integer  "baristum_id"
  end

  create_table "sharings", :force => true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "isActive",   :default => true
  end

  create_table "shop_checkins", :force => true do |t|
    t.integer  "shop_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isActive",   :default => true
  end

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "gmaps"
    t.boolean  "isActive",    :default => false
    t.integer  "photo_id"
  end

  create_table "user_badges", :force => true do |t|
    t.integer  "user_id"
    t.integer  "badge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isActive",   :default => true
  end

  create_table "user_locations", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isDefaultLocation", :default => true
  end

  create_table "user_relations", :force => true do |t|
    t.string   "RelatingUserID"
    t.integer  "RelatedUserID"
    t.integer  "RelationTypeID"
    t.datetime "RelationAcknowledge"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isActive",            :default => true
  end

  create_table "user_tokens", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.string   "slug"
    t.boolean  "admin",                               :default => false
    t.boolean  "reviewer",                            :default => false
    t.boolean  "isActive",                            :default => true
    t.integer  "photo_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
