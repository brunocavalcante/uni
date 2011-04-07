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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110407154630) do

  create_table "categoria_cursos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cursos", :force => true do |t|
    t.string   "nome"
    t.integer  "categoria_curso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplina_professores", :force => true do |t|
    t.integer  "disciplina_id"
    t.integer  "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplinas", :force => true do |t|
    t.string   "nome"
    t.integer  "creditos"
    t.integer  "curso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "escolaridades", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pessoas", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prerequisitos", :force => true do |t|
    t.integer  "disciplina_id"
    t.integer  "requisito_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professores", :force => true do |t|
    t.integer  "pessoa_id"
    t.integer  "escolaridade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
