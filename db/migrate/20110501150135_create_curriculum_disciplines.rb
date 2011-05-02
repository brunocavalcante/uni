class CreateCurriculumDisciplines < ActiveRecord::Migration
  def self.up
    create_table :curriculum_disciplines do |t|
      t.integer :curriculum_id
      t.integer :discipline_id
      t.string :module

      t.timestamps
    end
  end

  def self.down
    drop_table :curriculum_disciplines
  end
end
