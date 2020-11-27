# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_27_005259) do

  create_table "actives", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "way_1", null: false
    t.text "way_2", null: false
    t.text "way_3", null: false
    t.bigint "user_id"
    t.bigint "prep_id"
    t.bigint "task_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prep_id"], name: "index_actives_on_prep_id"
    t.index ["task_id"], name: "index_actives_on_task_id"
    t.index ["user_id"], name: "index_actives_on_user_id"
  end

  create_table "preps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "now", null: false
    t.text "target", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_preps_on_user_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "rev_1", null: false
    t.text "rev_2", null: false
    t.text "rev_3", null: false
    t.bigint "user_id"
    t.bigint "prep_id"
    t.bigint "task_id"
    t.bigint "active_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active_id"], name: "index_reviews_on_active_id"
    t.index ["prep_id"], name: "index_reviews_on_prep_id"
    t.index ["task_id"], name: "index_reviews_on_task_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "task_1", null: false
    t.text "task_2", null: false
    t.text "task_3", null: false
    t.bigint "user_id"
    t.bigint "prep_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prep_id"], name: "index_tasks_on_prep_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "actives", "preps"
  add_foreign_key "actives", "tasks"
  add_foreign_key "actives", "users"
  add_foreign_key "preps", "users"
  add_foreign_key "reviews", "actives"
  add_foreign_key "reviews", "preps"
  add_foreign_key "reviews", "tasks"
  add_foreign_key "reviews", "users"
  add_foreign_key "tasks", "preps"
  add_foreign_key "tasks", "users"
end
