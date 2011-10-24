class CreateLectureProfessors < ActiveRecord::Migration
  def change
    create_table :lecture_professors do |t|
      t.integer :lecture_id
      t.integer :professor_id

      t.timestamps
    end
  end
end
