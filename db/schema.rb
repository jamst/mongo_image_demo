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

ActiveRecord::Schema.define(version: 20160809035324) do

  create_table "avatars", force: :cascade do |t|
    t.string   "attachment_content_type", limit: 255
    t.string   "attachment_file_name",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_documents", force: :cascade do |t|
    t.string   "attachment",              limit: 255
    t.string   "attachment_content_size", limit: 255
    t.string   "attachment_content_type", limit: 255
    t.string   "attachment_type",         limit: 255
    t.integer  "attachment_type_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
