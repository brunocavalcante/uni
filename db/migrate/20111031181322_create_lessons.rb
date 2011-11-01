class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :lecture_id
      t.datetime :date
      t.string :title
      t.string :description
      t.integer :maximum_absences

      t.timestamps
    end
  end
end
