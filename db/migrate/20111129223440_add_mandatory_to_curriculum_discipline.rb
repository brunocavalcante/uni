class AddMandatoryToCurriculumDiscipline < ActiveRecord::Migration
  def change
    add_column :curriculum_disciplines, :mandatory, :boolean
  end
end
