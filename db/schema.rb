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

ActiveRecord::Schema.define(:version => 20110501155200) do

  create_table "academic_periods", :force => true do |t|
    t.string   "name"
    t.date     "start"
    t.date     "end"
    t.date     "registration_start"
    t.date     "registration_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.integer  "course_category_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curriculum_disciplines", :force => true do |t|
    t.integer  "curriculum_id"
    t.integer  "discipline_id"
    t.string   "module"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curriculum_students", :force => true do |t|
    t.integer  "curriculum_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curriculums", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplines", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parameters", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "specific_catalog"
    t.string   "specific_schema" 
    t.string   "specific_name"
    t.string   "ordinal_position"
    t.string   "parameter_mode"
    t.string   "is_result"
    t.string   "as_locator"
    t.string   "parameter_name"
    t.string   "data_type"
    t.integer  "character_maximum_length"
    t.integer  "character_octet_length"
    t.string   "character_set_catalog"
    t.string   "character_set_schema"
    t.string   "character_set_name"
    t.string   "collation_catalog"
    t.string   "collation_schema"
    t.string   "collation_name"
    t.string   "numeric_precision"
    t.string   "numeric_precision_radix" 
    t.string   "numeric_scale"
    t.string   "datetime_precision"
    t.string   "interval_type"
    t.string   "interval_precision"
    t.string   "udt_catalog"
    t.string   "udt_schema"
    t.string   "udt_name"
    t.string   "scope_catalog"
    t.string   "scope_schema"
    t.string   "scope_name"
    t.integer  "maximum_cardinality"
    t.string   "dtd_identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_roles", :force => true do |t|
    t.integer  "person_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prerequisites", :force => true do |t|
    t.integer  "curriculum_discipline_id"
    t.integer  "curriculum_discipline_prerequisite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professors", :force => true do |t|
    t.integer  "person_id"
    t.integer  "scholarity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scholarities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.integer  "person_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
