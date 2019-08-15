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

ActiveRecord::Schema.define(version: 2019_08_15_172141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mistakes", force: :cascade do |t|
    t.integer "user_id"
    t.text "description"
    t.text "processed_description"
    t.text "reflection"
    t.text "processed_reflection"
    t.integer "description_rating"
    t.integer "reflection_rating"
    t.date "reminder_date"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description_rating"], name: "index_mistakes_on_description_rating"
    t.index ["reflection_rating"], name: "index_mistakes_on_reflection_rating"
    t.index ["reminder_date"], name: "index_mistakes_on_reminder_date"
    t.index ["slug"], name: "index_mistakes_on_slug", unique: true
    t.index ["user_id"], name: "index_mistakes_on_user_id"
  end

  create_table "relationships_mistake_tags", force: :cascade do |t|
    t.integer "mistake_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mistake_id"], name: "index_relationships_mistake_tags_on_mistake_id"
    t.index ["tag_id"], name: "index_relationships_mistake_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "cached_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cached_count"], name: "index_tags_on_cached_count"
    t.index ["name"], name: "index_tags_on_name"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.integer "follow_up_frequency"
    t.integer "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["follow_up_frequency"], name: "index_users_on_follow_up_frequency"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
