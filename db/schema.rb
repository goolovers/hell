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

ActiveRecord::Schema.define(version: 2019_10_18_150745) do

  create_table "_users_old_20191011", force: :cascade do |t|
    t.string "user_code"
    t.string "user_name"
    t.string "password"
    t.integer "user_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "material_type"
    t.string "material_code"
    t.string "material_name"
    t.string "specs"
    t.string "unit"
    t.string "brand"
    t.integer "num"
    t.string "supplier"
    t.integer "tax_rate"
    t.float "before_tax"
    t.float "after_tax"
    t.text "remark"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.string "show_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_code"
    t.string "user_name"
    t.string "password"
    t.integer "user_type"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

end
