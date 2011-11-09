class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.integer :test_id
      t.integer :lecture_student_id
      t.string :rating
      t.datetime :date

      t.timestamps
    end
  end
end
