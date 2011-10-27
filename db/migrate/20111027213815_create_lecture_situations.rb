class CreateLectureSituations < ActiveRecord::Migration
  def change
    create_table :lecture_situations do |t|
      t.string :name
      t.boolean :approved

      t.timestamps
    end
  end
end
