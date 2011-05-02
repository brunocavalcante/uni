class CreateCurriculumStudents < ActiveRecord::Migration
  def self.up
    create_table :curriculum_students do |t|
      t.integer :curriculum_id
      t.integer :student_id

      t.timestamps
    end
  end

  def self.down
    drop_table :curriculum_students
  end
end
