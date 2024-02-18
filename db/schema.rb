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

ActiveRecord::Schema[7.0].define(version: 2024_02_18_173249) do
  create_table "destinatarios", force: :cascade do |t|
    t.string "nome"
    t.date "data_nascimento"
    t.string "cpf"
    t.string "email"
    t.string "telefone"
    t.integer "endereco_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["endereco_id"], name: "index_destinatarios_on_endereco_id"
  end

  create_table "encomendas", force: :cascade do |t|
    t.float "peso"
    t.string "status"
    t.date "data_entrega"
    t.integer "destinatario_id", null: false
    t.integer "remetente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "transportadora_id", null: false
    t.index ["destinatario_id"], name: "index_encomendas_on_destinatario_id"
    t.index ["remetente_id"], name: "index_encomendas_on_remetente_id"
    t.index ["transportadora_id"], name: "index_encomendas_on_transportadora_id"
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "logradouro"
    t.string "numero"
    t.string "complemento"
    t.string "cidade"
    t.string "bairro"
    t.string "pais"
    t.string "codigo_postal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.string "cargo"
    t.date "data_nascimento"
    t.string "cpf"
    t.string "email"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "remetentes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.integer "endereco_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["endereco_id"], name: "index_remetentes_on_endereco_id"
  end

  create_table "transportadoras", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "cnpj"
    t.integer "endereco_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["endereco_id"], name: "index_transportadoras_on_endereco_id"
  end

  add_foreign_key "destinatarios", "enderecos"
  add_foreign_key "encomendas", "destinatarios"
  add_foreign_key "encomendas", "remetentes"
  add_foreign_key "encomendas", "transportadoras"
  add_foreign_key "remetentes", "enderecos"
  add_foreign_key "transportadoras", "enderecos"
end
