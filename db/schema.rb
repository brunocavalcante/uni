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

ActiveRecord::Schema.define(:version => 20110417164256) do

  create_table "aluno_cursos", :force => true do |t|
    t.integer  "aluno_id"
    t.integer  "curso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alunos", :force => true do |t|
    t.integer  "pessoa_id"
    t.string   "matricula"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categoria_cursos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curso_disciplinas", :force => true do |t|
    t.integer  "curso_id"
    t.integer  "disciplina_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cursos", :force => true do |t|
    t.string   "nome"
    t.integer  "categoria_curso_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplinas", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "escolaridades", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perfil_pessoas", :force => true do |t|
    t.integer  "pessoa_id"
    t.integer  "perfil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perfis", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periodos", :force => true do |t|
    t.string   "nome"
    t.date     "inicio"
    t.date     "fim"
    t.date     "iniciomatricula"
    t.date     "fimmatricula"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pessoas", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "senha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "pg_aggregate" because of following StandardError
#   Unknown type 'regproc' for column 'aggfnoid'

# Could not dump table "pg_am" because of following StandardError
#   Unknown type 'name' for column 'amname'

  create_table "pg_amop", :id => false, :force => true do |t|
    t.integer "amopfamily",                 :null => false
    t.integer "amoplefttype",               :null => false
    t.integer "amoprighttype",              :null => false
    t.integer "amopstrategy",  :limit => 2, :null => false
    t.integer "amopopr",                    :null => false
    t.integer "amopmethod",                 :null => false
  end

# Could not dump table "pg_amproc" because of following StandardError
#   Unknown type 'regproc' for column 'amproc'

  create_table "pg_attrdef", :id => false, :force => true do |t|
    t.integer "adrelid",              :null => false
    t.integer "adnum",   :limit => 2, :null => false
    t.text    "adbin"
    t.text    "adsrc"
  end

# Could not dump table "pg_attribute" because of following StandardError
#   Unknown type 'name' for column 'attname'

  create_table "pg_auth_members", :id => false, :force => true do |t|
    t.integer "roleid",       :null => false
    t.integer "member",       :null => false
    t.integer "grantor",      :null => false
    t.boolean "admin_option", :null => false
  end

# Could not dump table "pg_authid" because of following StandardError
#   Unknown type 'name' for column 'rolname'

  create_table "pg_cast", :id => false, :force => true do |t|
    t.integer "castsource",                 :null => false
    t.integer "casttarget",                 :null => false
    t.integer "castfunc",                   :null => false
    t.string  "castcontext", :limit => nil, :null => false
    t.string  "castmethod",  :limit => nil, :null => false
  end

# Could not dump table "pg_class" because of following StandardError
#   Unknown type 'name' for column 'relname'

# Could not dump table "pg_constraint" because of following StandardError
#   Unknown type 'name' for column 'conname'

# Could not dump table "pg_conversion" because of following StandardError
#   Unknown type 'name' for column 'conname'

# Could not dump table "pg_database" because of following StandardError
#   Unknown type 'name' for column 'datname'

  create_table "pg_depend", :id => false, :force => true do |t|
    t.integer "classid",                    :null => false
    t.integer "objid",                      :null => false
    t.integer "objsubid",                   :null => false
    t.integer "refclassid",                 :null => false
    t.integer "refobjid",                   :null => false
    t.integer "refobjsubid",                :null => false
    t.string  "deptype",     :limit => nil, :null => false
  end

  create_table "pg_description", :id => false, :force => true do |t|
    t.integer "objoid",      :null => false
    t.integer "classoid",    :null => false
    t.integer "objsubid",    :null => false
    t.text    "description"
  end

# Could not dump table "pg_enum" because of following StandardError
#   Unknown type 'name' for column 'enumlabel'

# Could not dump table "pg_foreign_data_wrapper" because of following StandardError
#   Unknown type 'name' for column 'fdwname'

# Could not dump table "pg_foreign_server" because of following StandardError
#   Unknown type 'name' for column 'srvname'

# Could not dump table "pg_index" because of following StandardError
#   Unknown type 'oidvector' for column 'indclass'

  create_table "pg_inherits", :id => false, :force => true do |t|
    t.integer "inhrelid",  :null => false
    t.integer "inhparent", :null => false
    t.integer "inhseqno",  :null => false
  end

# Could not dump table "pg_language" because of following StandardError
#   Unknown type 'name' for column 'lanname'

  create_table "pg_largeobject", :id => false, :force => true do |t|
    t.integer "loid",   :null => false
    t.integer "pageno", :null => false
    t.binary  "data"
  end

# Could not dump table "pg_listener" because of following StandardError
#   Unknown type 'name' for column 'relname'

# Could not dump table "pg_namespace" because of following StandardError
#   Unknown type 'name' for column 'nspname'

# Could not dump table "pg_opclass" because of following StandardError
#   Unknown type 'name' for column 'opcname'

# Could not dump table "pg_operator" because of following StandardError
#   Unknown type 'name' for column 'oprname'

# Could not dump table "pg_opfamily" because of following StandardError
#   Unknown type 'name' for column 'opfname'

# Could not dump table "pg_pltemplate" because of following StandardError
#   Unknown type 'name' for column 'tmplname'

# Could not dump table "pg_proc" because of following StandardError
#   Unknown type 'name' for column 'proname'

# Could not dump table "pg_rewrite" because of following StandardError
#   Unknown type 'name' for column 'rulename'

  create_table "pg_shdepend", :id => false, :force => true do |t|
    t.integer "dbid",                      :null => false
    t.integer "classid",                   :null => false
    t.integer "objid",                     :null => false
    t.integer "objsubid",                  :null => false
    t.integer "refclassid",                :null => false
    t.integer "refobjid",                  :null => false
    t.string  "deptype",    :limit => nil, :null => false
  end

  create_table "pg_shdescription", :id => false, :force => true do |t|
    t.integer "objoid",      :null => false
    t.integer "classoid",    :null => false
    t.text    "description"
  end

# Could not dump table "pg_statistic" because of following StandardError
#   Unknown type 'anyarray' for column 'stavalues1'

# Could not dump table "pg_tablespace" because of following StandardError
#   Unknown type 'name' for column 'spcname'

# Could not dump table "pg_trigger" because of following StandardError
#   Unknown type 'name' for column 'tgname'

# Could not dump table "pg_ts_config" because of following StandardError
#   Unknown type 'name' for column 'cfgname'

  create_table "pg_ts_config_map", :id => false, :force => true do |t|
    t.integer "mapcfg",       :null => false
    t.integer "maptokentype", :null => false
    t.integer "mapseqno",     :null => false
    t.integer "mapdict",      :null => false
  end

# Could not dump table "pg_ts_dict" because of following StandardError
#   Unknown type 'name' for column 'dictname'

# Could not dump table "pg_ts_parser" because of following StandardError
#   Unknown type 'name' for column 'prsname'

# Could not dump table "pg_ts_template" because of following StandardError
#   Unknown type 'name' for column 'tmplname'

# Could not dump table "pg_type" because of following StandardError
#   Unknown type 'name' for column 'typname'

  create_table "pg_user_mapping", :id => false, :force => true do |t|
    t.integer "umuser",                   :null => false
    t.integer "umserver",                 :null => false
    t.string  "umoptions", :limit => nil
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
