class CreateLectureAbsences < ActiveRecord::Migration
  def change
    create_table :lecture_absences do |t|
      t.integer :lecture_id
      t.date :date

      t.timestamps
    end
  end
end
