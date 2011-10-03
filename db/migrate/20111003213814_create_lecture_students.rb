class CreateLectureStudents < ActiveRecord::Migration
  def self.up
    create_table :lecture_students do |t|
      t.integer :lecture_id
      t.integer :student_id
      t.string :grade

      t.timestamps
    end
  end

  def self.down
    drop_table :lecture_students
  end
end
