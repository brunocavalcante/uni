class CreateLectureFiles < ActiveRecord::Migration
  def change
    create_table :lecture_files do |t|
      t.integer :lecture_id
      t.string :name
      t.integer :person_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
