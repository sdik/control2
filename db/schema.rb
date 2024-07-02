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

ActiveRecord::Schema[7.0].define(version: 2024_07_02_165908) do
  create_table "contas", force: :cascade do |t|
    t.string "nome"
    t.string "tipo"
    t.decimal "saldo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pagamentos", force: :cascade do |t|
    t.integer "pessoa_id", null: false
    t.string "descricao"
    t.decimal "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.decimal "valorpago"
    t.integer "conta_id"
    t.date "data_vencimento"
    t.date "data_pagamento"
    t.index ["conta_id"], name: "index_pagamentos_on_conta_id"
    t.index ["pessoa_id"], name: "index_pagamentos_on_pessoa_id"
  end

  create_table "persoas", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "bairro"
    t.string "cidade"
    t.string "email"
    t.string "telefone"
    t.string "cnpj_cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "bairro"
    t.string "cidade"
    t.string "email"
    t.string "telefone"
    t.string "cnpj_cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recebiveis", force: :cascade do |t|
    t.integer "pessoa_id", null: false
    t.decimal "valor"
    t.date "data_recebimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "conta_id"
    t.date "vencimento"
    t.decimal "valorpago"
    t.integer "status"
    t.index ["conta_id"], name: "index_recebiveis_on_conta_id"
    t.index ["pessoa_id"], name: "index_recebiveis_on_pessoa_id"
  end

  add_foreign_key "pagamentos", "contas"
  add_foreign_key "pagamentos", "pessoas"
  add_foreign_key "recebiveis", "contas"
  add_foreign_key "recebiveis", "pessoas"
end
