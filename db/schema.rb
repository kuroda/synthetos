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

ActiveRecord::Schema.define(:version => 20120327133443) do

  create_table "categories", :id => false, :force => true do |t|
    t.string   "code",       :null => false
    t.string   "name",       :null => false
    t.date     "started_on", :null => false
    t.date     "ended_on"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["code", "started_on"], :name => "index_categories_on_code_and_started_on", :unique => true

  create_table "category_product_links", :id => false, :force => true do |t|
    t.string   "category_code"
    t.string   "product_code"
    t.date     "started_on",    :null => false
    t.date     "ended_on"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "category_product_links", ["category_code", "product_code", "started_on"], :name => "index_category_product_links_on_codes", :unique => true

  create_table "departments", :id => false, :force => true do |t|
    t.string   "code",       :null => false
    t.string   "name",       :null => false
    t.date     "started_on", :null => false
    t.date     "ended_on"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "departments", ["code", "started_on"], :name => "index_departments_on_code_and_started_on", :unique => true

  create_table "products", :id => false, :force => true do |t|
    t.string   "code",            :null => false
    t.string   "department_code", :null => false
    t.string   "name",            :null => false
    t.text     "description"
    t.date     "started_on",      :null => false
    t.date     "ended_on"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "products", ["code", "started_on"], :name => "index_products_on_code_and_started_on", :unique => true

end
