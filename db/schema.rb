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

ActiveRecord::Schema.define(version: 2019_01_21_135252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "form_field_options", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.integer "form_field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_fields", force: :cascade do |t|
    t.integer "form_id"
    t.string "name"
    t.string "input_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "step"
    t.string "placeholder"
    t.boolean "trackable"
  end

  create_table "form_responses", force: :cascade do |t|
    t.integer "form_field_id"
    t.string "responder_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "page_template_variable_values", force: :cascade do |t|
    t.integer "page_id"
    t.integer "template_variable_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.text "confirmation_email_html"
  end

  create_table "template_variables", force: :cascade do |t|
    t.string "key_name"
    t.string "default_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "template_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.text "template_code"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
