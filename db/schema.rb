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

ActiveRecord::Schema[7.2].define(version: 2025_04_03_123418) do
  create_table "despesas", force: :cascade do |t|
    t.integer "orcamento_id", null: false
    t.integer "forma_pagamento_id", null: false
    t.text "descricao"
    t.integer "categoria"
    t.date "data_gasto"
    t.float "valor"
    t.integer "status"
    t.integer "quantidade_parcelas"
    t.integer "parcela_atual"
    t.integer "dia_vencimento"
    t.date "data_vencimento"
    t.boolean "alertar_vencimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unidade_familiar_id", null: false
    t.index ["forma_pagamento_id"], name: "index_despesas_on_forma_pagamento_id"
    t.index ["orcamento_id"], name: "index_despesas_on_orcamento_id"
    t.index ["unidade_familiar_id"], name: "index_despesas_on_unidade_familiar_id"
  end

  create_table "forma_pagamentos", force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.string "nome"
    t.integer "tipo"
    t.date "vencimento_fatura"
    t.date "fechamento_fatura"
    t.integer "status"
    t.integer "categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_forma_pagamentos_on_usuario_id"
  end

  create_table "historico_pagamentos", force: :cascade do |t|
    t.integer "despesa_id", null: false
    t.date "data_pagamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["despesa_id"], name: "index_historico_pagamentos_on_despesa_id"
  end

  create_table "orcamentos", force: :cascade do |t|
    t.integer "unidade_familiar_id", null: false
    t.string "categoria"
    t.integer "status"
    t.text "descricao"
    t.float "valorEstimado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_familiar_id"], name: "index_orcamentos_on_unidade_familiar_id"
  end

  create_table "receitas", force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.float "valor"
    t.text "descricao"
    t.date "dataEntrada"
    t.date "dataEncerramento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_receitas_on_usuario_id"
  end

  create_table "unidade_familiares", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.integer "status"
    t.integer "categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.integer "unidade_familiar_id", null: false
    t.string "nome"
    t.string "email"
    t.string "senha"
    t.integer "status"
    t.integer "perfil"
    t.boolean "receber_alerta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_familiar_id"], name: "index_usuarios_on_unidade_familiar_id"
  end

  add_foreign_key "despesas", "forma_pagamentos"
  add_foreign_key "despesas", "orcamentos"
  add_foreign_key "despesas", "unidade_familiares"
  add_foreign_key "forma_pagamentos", "usuarios"
  add_foreign_key "historico_pagamentos", "despesas"
  add_foreign_key "orcamentos", "unidade_familiares"
  add_foreign_key "receitas", "usuarios"
  add_foreign_key "usuarios", "unidade_familiares"
end
