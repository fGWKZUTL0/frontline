# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_15_212220) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "position_id", null: false
    t.index ["position_id"], name: "index_doctors_on_position_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.bigint "patient_id", null: false
    t.date "writing_date"
    t.bigint "writer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_medical_records_on_patient_id"
    t.index ["tenant_id"], name: "index_medical_records_on_tenant_id"
    t.index ["writer_id"], name: "index_medical_records_on_writer_id"
  end

  create_table "nurses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "position_id", null: false
    t.index ["position_id"], name: "index_nurses_on_position_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "family_name"
    t.string "first_name"
    t.date "born_date"
    t.bigint "doctor_id", null: false
    t.bigint "nurse_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id", default: 3, null: false
    t.index ["doctor_id"], name: "index_patients_on_doctor_id"
    t.index ["nurse_id"], name: "index_patients_on_nurse_id"
    t.index ["tenant_id"], name: "index_patients_on_tenant_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "order_num"
    t.integer "category_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "family_name"
    t.string "first_name"
    t.bigint "tenant_id", null: false
    t.string "user_model_type"
    t.bigint "user_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tenant_id"], name: "index_users_on_tenant_id"
    t.index ["user_model_id"], name: "index_users_on_user_model_id"
  end

  add_foreign_key "doctors", "services", column: "position_id"
  add_foreign_key "medical_records", "hospitals", column: "tenant_id"
  add_foreign_key "medical_records", "patients"
  add_foreign_key "medical_records", "users", column: "writer_id"
  add_foreign_key "nurses", "services", column: "position_id"
  add_foreign_key "patients", "hospitals", column: "tenant_id"
  add_foreign_key "users", "hospitals", column: "tenant_id"

  create_policy "medical_records"
  create_policy "patients"
  create_policy "users"
end
