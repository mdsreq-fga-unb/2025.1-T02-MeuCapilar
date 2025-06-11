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

ActiveRecord::Schema[7.1].define(version: 2025_06_11_045830) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atendimentos", force: :cascade do |t|
    t.bigint "paciente_id", null: false
    t.bigint "terapeuta_id", null: false
    t.datetime "data"
    t.string "servico"
    t.string "status"
    t.text "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_atendimentos_on_paciente_id"
    t.index ["terapeuta_id"], name: "index_atendimentos_on_terapeuta_id"
  end

  create_table "pacientes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "nome"
    t.string "cpf"
    t.string "telefone"
    t.date "data_nascimento"
    t.text "endereco"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pacientes_on_user_id"
  end

  create_table "registro_clinicos", force: :cascade do |t|
    t.bigint "paciente_id", null: false
    t.bigint "terapeuta_id", null: false
    t.text "diagnostico"
    t.text "tratamento"
    t.text "observacoes"
    t.datetime "data_registro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_registro_clinicos_on_paciente_id"
    t.index ["terapeuta_id"], name: "index_registro_clinicos_on_terapeuta_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "terapeuta", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "nome"
    t.string "cpf"
    t.string "telefone"
    t.string "especialidade"
    t.string "cref"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_terapeuta_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "user_type", null: false
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "atendimentos", "pacientes"
  add_foreign_key "atendimentos", "terapeuta", column: "terapeuta_id"
  add_foreign_key "pacientes", "users"
  add_foreign_key "registro_clinicos", "pacientes"
  add_foreign_key "registro_clinicos", "terapeuta", column: "terapeuta_id"
  add_foreign_key "terapeuta", "users"
end
