# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161006143715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alunos", force: :cascade do |t|
    t.string   "cpf"
    t.integer  "rg"
    t.date     "data_nascimento"
    t.string   "nome"
    t.string   "telefone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "buscas", force: :cascade do |t|
    t.integer  "aluno_id"
    t.integer  "curso_id"
    t.integer  "matricula_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "buscas", ["aluno_id"], name: "index_buscas_on_aluno_id", using: :btree
  add_index "buscas", ["curso_id"], name: "index_buscas_on_curso_id", using: :btree
  add_index "buscas", ["matricula_id"], name: "index_buscas_on_matricula_id", using: :btree

  create_table "cursos", force: :cascade do |t|
    t.string   "nome"
    t.decimal  "valor_inscricao"
    t.integer  "periodo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "matriculas", force: :cascade do |t|
    t.integer  "aluno_id"
    t.integer  "curso_id"
    t.date     "data_matricula"
    t.integer  "ano"
    t.integer  "ativo"
    t.integer  "pago"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "matriculas", ["aluno_id"], name: "index_matriculas_on_aluno_id", using: :btree
  add_index "matriculas", ["curso_id"], name: "index_matriculas_on_curso_id", using: :btree

  create_table "pagamentos", force: :cascade do |t|
    t.decimal  "troco"
    t.decimal  "dinheiro"
    t.integer  "matricula_id"
    t.integer  "curso_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "pagamentos", ["curso_id"], name: "index_pagamentos_on_curso_id", using: :btree
  add_index "pagamentos", ["matricula_id"], name: "index_pagamentos_on_matricula_id", using: :btree

  add_foreign_key "buscas", "alunos"
  add_foreign_key "buscas", "cursos"
  add_foreign_key "buscas", "matriculas"
  add_foreign_key "matriculas", "alunos"
  add_foreign_key "matriculas", "cursos"
  add_foreign_key "pagamentos", "cursos"
  add_foreign_key "pagamentos", "matriculas"
end
