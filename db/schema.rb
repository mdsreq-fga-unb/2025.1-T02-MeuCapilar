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

ActiveRecord::Schema[7.1].define(version: 2025_07_10_215934) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "atendimentos", force: :cascade do |t|
    t.bigint "paciente_id", null: false
    t.bigint "terapeuta_id", null: false
    t.datetime "data"
    t.string "servico"
    t.string "status"
    t.text "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duracao"
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
    t.text "historico_familiar"
    t.text "medicamentos_uso"
    t.text "alergias"
    t.text "observacoes"
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
    t.string "tipo_registro"
    t.text "queixa_principal"
    t.text "plano_terapeutico"
    t.date "proxima_consulta"
    t.bigint "atendimento_id"
    t.index ["atendimento_id"], name: "index_registro_clinicos_on_atendimento_id"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "atendimentos", "pacientes"
  add_foreign_key "atendimentos", "terapeuta", column: "terapeuta_id"
  add_foreign_key "pacientes", "users"
  add_foreign_key "registro_clinicos", "atendimentos"
  add_foreign_key "registro_clinicos", "pacientes"
  add_foreign_key "registro_clinicos", "terapeuta", column: "terapeuta_id"
  add_foreign_key "terapeuta", "users"
end
