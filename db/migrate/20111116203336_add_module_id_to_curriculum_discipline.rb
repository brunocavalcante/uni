class AddModuleIdToCurriculumDiscipline < ActiveRecord::Migration
  def change
    add_column :curriculum_disciplines, :curriculum_module_id, :integer
    remove_column :curriculum_disciplines, :module
  end
end
