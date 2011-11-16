class CreateCurriculumDisciplinePrerequisites < ActiveRecord::Migration
  def change
    create_table :curriculum_discipline_prerequisites do |t|
      t.integer :curriculum_discipline_id
      t.integer :dependent_curriculum_discipline_id

      t.timestamps
    end
  end
end
