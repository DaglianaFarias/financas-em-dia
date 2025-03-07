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

ActiveRecord::Schema[7.2].define(version: 2025_03_07_153237) do
  create_table "orcamentos", force: :cascade do |t|
    t.integer "unidade_familiar_id", null: false
    t.string "categoria"
    t.integer "status"
    t.string "descricao"
    t.float "valorEstimado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_familiar_id"], name: "index_orcamentos_on_unidade_familiar_id"
  end

  create_table "receitas", force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.decimal "valor"
    t.text "descricao"
    t.date "dataEntrada"
    t.date "dataEncerramento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_receitas_on_usuario_id"
  end

  create_table "unidade_familiares", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.integer "status"
    t.integer "categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha"
    t.integer "status"
    t.integer "perfil"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unidade_familiar_id", null: false
    t.index ["unidade_familiar_id"], name: "index_usuarios_on_unidade_familiar_id"
  end

  add_foreign_key "orcamentos", "unidade_familiares"
  add_foreign_key "receitas", "usuarios"
  add_foreign_key "usuarios", "unidade_familiares"
end
