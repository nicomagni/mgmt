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

ActiveRecord::Schema.define(version: 20130510142950) do

  create_table "issues", force: true do |t|
    t.string   "status",          default: "not_started"
    t.string   "issue_type",      default: "feature"
    t.decimal  "estimated_hours"
    t.integer  "number"
    t.integer  "project_id"
    t.string   "github_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority",        default: 0
  end

  add_index "issues", ["project_id"], name: "index_issues_on_project_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "organization"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["organization", "name"], name: "index_projects_on_organization_and_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "login"
    t.string   "token"
    t.string   "organization_avatar"
    t.string   "gravatar_id"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree

  create_table "worked_hours_entries", force: true do |t|
    t.decimal "amount"
    t.integer "user_id"
    t.integer "issue_id"
    t.date    "date"
  end

  add_index "worked_hours_entries", ["date"], name: "index_worked_hours_entries_on_date", using: :btree
  add_index "worked_hours_entries", ["issue_id"], name: "index_worked_hours_entries_on_issue_id", using: :btree
  add_index "worked_hours_entries", ["user_id"], name: "index_worked_hours_entries_on_user_id", using: :btree

end
