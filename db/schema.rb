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

ActiveRecord::Schema.define(version: 2019_11_09_093036) do

  create_table "_storage_materials_old_20191030", force: :cascade do |t|
    t.integer "num"
    t.integer "material_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "lower_num"
  end

  create_table "_users_old_20191011", force: :cascade do |t|
    t.string "user_code"
    t.string "user_name"
    t.string "password"
    t.integer "user_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "io_task_dets", force: :cascade do |t|
    t.integer "io_task_id"
    t.integer "material_id"
    t.integer "product_id"
    t.integer "num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "io_tasks", force: :cascade do |t|
    t.string "io_type"
    t.string "io_reason"
    t.datetime "io_at"
    t.integer "apply_user_id"
    t.integer "exec_user_id"
    t.string "status"
    t.string "material_product_type"
    t.string "io_wh"
    t.integer "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "check_user_id"
    t.string "remark"
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
    t.integer "lower_num"
  end

  create_table "p_codes", force: :cascade do |t|
    t.string "type_code"
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_items", force: :cascade do |t|
    t.integer "num"
    t.integer "product_id"
    t.integer "material_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "material_type"
    t.string "material_code"
    t.string "material_name"
    t.string "specs"
    t.string "unit"
    t.string "brand"
    t.integer "num"
    t.string "supplier"
    t.text "remark"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "lower_num"
  end

  create_table "project_materials", force: :cascade do |t|
    t.integer "project_id"
    t.integer "material_id"
    t.string "stock_type"
    t.integer "need_num"
    t.integer "stock_num"
    t.integer "project_num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_products", force: :cascade do |t|
    t.integer "project_id"
    t.integer "product_id"
    t.string "stock_type"
    t.integer "need_num"
    t.integer "stock_num"
    t.integer "project_num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.datetime "plan_start_time"
    t.datetime "plan_end_time"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "charge"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "storage_materials", force: :cascade do |t|
    t.integer "num"
    t.integer "material_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "storage_products", force: :cascade do |t|
    t.integer "num"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
