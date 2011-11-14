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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111114184258) do

  create_table "academic_periods", :force => true do |t|
    t.string   "name"
    t.date     "start"
    t.date     "end"
    t.date     "registration_start"
    t.date     "registration_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", :force => true do |t|
    t.integer  "student_id"
    t.string   "code"
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
    t.boolean  "active"
  end

  create_table "curriculums", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "active"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplines", :force => true do |t|
    t.integer  "course_id"
    t.string   "code"
    t.string   "name"
    t.integer  "version"
    t.integer  "credits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "syllabus"
  end

  create_table "lecture_files", :force => true do |t|
    t.integer  "lecture_id"
    t.string   "name"
    t.integer  "person_id"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lesson_id"
  end

  create_table "lecture_professors", :force => true do |t|
    t.integer  "lecture_id"
    t.integer  "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lecture_situations", :force => true do |t|
    t.string   "name"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lecture_students", :force => true do |t|
    t.integer  "lecture_id"
    t.integer  "student_id"
    t.string   "grade"
    t.integer  "attendance"
    t.integer  "lecture_situation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lecture_time_slots", :force => true do |t|
    t.integer  "lecture_id"
    t.integer  "weekday"
    t.integer  "start_time"
    t.integer  "end_time"
    t.string   "rrule"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lectures", :force => true do |t|
    t.integer  "discipline_id"
    t.integer  "academic_period_id"
    t.string   "code"
    t.integer  "places"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "end_date"
  end

  create_table "lesson_absences", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "lecture_student_id"
    t.integer  "ammount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", :force => true do |t|
    t.integer  "lecture_id"
    t.datetime "date"
    t.string   "title"
    t.string   "description"
    t.integer  "maximum_absences"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "person_id"
    t.string   "subject"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parameters", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
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

  create_table "sites", :force => true do |t|
    t.integer  "person_id"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.integer  "person_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_results", :force => true do |t|
    t.integer  "test_id"
    t.integer  "lecture_student_id"
    t.string   "rating"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", :force => true do |t|
    t.integer  "lecture_id"
    t.string   "name"
    t.datetime "scheduled_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transferred_disciplines", :force => true do |t|
    t.integer  "curriculum_student_id"
    t.integer  "discipline_id"
    t.string   "grade"
    t.integer  "attendance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "walls", :force => true do |t|
    t.integer  "message_id"
    t.integer  "lecture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
