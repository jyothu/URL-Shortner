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

ActiveRecord::Schema.define(version: 20180503111357) do

  create_table "audit_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "url_id"
    t.text     "request_details", limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["url_id"], name: "index_audit_logs_on_url_id", using: :btree
  end

  create_table "urls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "original_url",   limit: 65535
    t.string   "shortened_url"
    t.string   "shortened"
    t.string   "customized_url"
    t.string   "created_by"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["customized_url"], name: "index_urls_on_customized_url", unique: true, using: :btree
    t.index ["shortened"], name: "index_urls_on_shortened", unique: true, using: :btree
  end

end
