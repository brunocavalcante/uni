class CreateLectureStudentAbsences < ActiveRecord::Migration
  def change
    create_table :lecture_student_absences do |t|
      t.integer :lecture_absence_id
      t.integer :lecture_student_id
      t.integer :ammount

      t.timestamps
    end
  end
end
