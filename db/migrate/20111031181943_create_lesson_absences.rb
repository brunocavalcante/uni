class CreateLessonAbsences < ActiveRecord::Migration
  def change
    create_table :lesson_absences do |t|
      t.integer :lesson_id
      t.integer :lecture_student_id
      t.integer :ammount

      t.timestamps
    end
  end
end
