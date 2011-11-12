class CreateTransferredDisciplines < ActiveRecord::Migration
  def change
    create_table :transferred_disciplines do |t|
      t.integer :curriculum_student_id
      t.integer :discipline_id
      t.string :grade
      t.integer :attendance

      t.timestamps
    end
  end
end
