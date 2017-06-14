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

ActiveRecord::Schema.define(version: 20170614075407) do

  create_table "article_invs", force: true do |t|
    t.string   "name"
    t.integer  "author_inv_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_invs", ["author_inv_id"], name: "index_article_invs_on_author_inv_id"

  create_table "articles", force: true do |t|
    t.string   "name"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id"

  create_table "author_invs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "criminal_invs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "criminals", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_invs", force: true do |t|
    t.string   "name"
    t.integer  "user_inv_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "email_invs", ["user_inv_id"], name: "index_email_invs_on_user_inv_id"

  create_table "emails", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emails", ["user_id"], name: "index_emails_on_user_id"

  create_table "prison_invs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prisons", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sentence_invs", force: true do |t|
    t.integer  "length"
    t.integer  "criminal_inv_id"
    t.integer  "prison_inv_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sentence_invs", ["criminal_inv_id"], name: "index_sentence_invs_on_criminal_inv_id"
  add_index "sentence_invs", ["prison_inv_id"], name: "index_sentence_invs_on_prison_inv_id"

  create_table "sentences", force: true do |t|
    t.integer  "length"
    t.integer  "criminal_id"
    t.integer  "prison_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sentences", ["criminal_id"], name: "index_sentences_on_criminal_id"
  add_index "sentences", ["prison_id"], name: "index_sentences_on_prison_id"

  create_table "user_invs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
