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

ActiveRecord::Schema.define(:version => 20120816044840) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.string   "answer_text"
    t.boolean  "correct"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "topic_id"
    t.text     "question_text"
    t.string   "difficulty"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sections", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.string   "code"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "age_requirement"
    t.string   "citizenship_requirement"
    t.string   "residency_requirement"
    t.string   "ssn_requirement"
    t.text     "education_requirement"
    t.string   "international_examination_program"
    t.text     "hours_requirement"
    t.text     "sitting_requirements"
    t.text     "experience_requirements"
    t.text     "ethics_requirements"
    t.text     "notes"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "board_name"
    t.text     "address"
    t.string   "telephone_number"
    t.string   "fax_number"
    t.string   "email_address"
    t.string   "website"
  end

  create_table "topics", :force => true do |t|
    t.integer  "section_id"
    t.string   "code"
    t.string   "name"
    t.string   "parent_code"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_test_questions", :force => true do |t|
    t.integer  "user_test_id"
    t.integer  "question_id"
    t.integer  "answered_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "user_tests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
