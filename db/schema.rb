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

ActiveRecord::Schema.define(version: 20170703093614) do

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

  create_table "child_invs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "child_invs_parent_invs", id: false, force: true do |t|
    t.integer "child_inv_id",  null: false
    t.integer "parent_inv_id", null: false
  end

  add_index "child_invs_parent_invs", ["child_inv_id", "parent_inv_id"], name: "index_child_invs_parent_invs_on_child_inv_id_and_parent_inv_id"
  add_index "child_invs_parent_invs", ["parent_inv_id", "child_inv_id"], name: "index_child_invs_parent_invs_on_parent_inv_id_and_child_inv_id"

  create_table "children", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "children_parents", id: false, force: true do |t|
    t.integer "child_id",  null: false
    t.integer "parent_id", null: false
  end

  add_index "children_parents", ["child_id", "parent_id"], name: "index_children_parents_on_child_id_and_parent_id"
  add_index "children_parents", ["parent_id", "child_id"], name: "index_children_parents_on_parent_id_and_child_id"

  create_table "course_invs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
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

  create_table "parent_invs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parents", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "teaching_assistant_invs", force: true do |t|
    t.string   "name"
    t.integer  "teachable_inv_id"
    t.string   "teachable_inv_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teaching_assistant_invs", ["teachable_inv_id", "teachable_inv_type"], name: "index_teach_asst_invs_on_teachable_inv_id_n_teachable_inv_type"

  create_table "teaching_assistants", force: true do |t|
    t.string   "name"
    t.integer  "teachable_id"
    t.string   "teachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teaching_assistants", ["teachable_id", "teachable_type"], name: "index_teaching_assistants_on_teachable_id_and_teachable_type"

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
