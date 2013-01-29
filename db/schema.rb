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

ActiveRecord::Schema.define(:version => 20130129183413) do

  create_table "bankers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "banker_email"
    t.string   "user_name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password"
  end

  create_table "bankers_susus", :id => false, :force => true do |t|
    t.integer "banker_id"
    t.integer "susu_id"
  end

  add_index "bankers_susus", ["banker_id", "susu_id"], :name => "index_bankers_susus_on_banker_id_and_susu_id"

  create_table "goals", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "goal_amount"
    t.integer  "member_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "member_email"
    t.string   "user_name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "susu_id"
  end

  create_table "members_susus", :id => false, :force => true do |t|
    t.integer "member_id"
    t.integer "susu_id"
  end

  add_index "members_susus", ["member_id", "susu_id"], :name => "index_members_susus_on_member_id_and_susu_id"

  create_table "susus", :force => true do |t|
    t.string   "name"
    t.integer  "num_of_members"
    t.integer  "length"
    t.string   "pay_out_rotation"
    t.decimal  "pay_in_amount"
    t.decimal  "pay_out_amount"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "banker_id"
  end

end
