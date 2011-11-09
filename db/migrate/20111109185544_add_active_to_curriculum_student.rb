class AddActiveToCurriculumStudent < ActiveRecord::Migration
  def change
    add_column :curriculum_students, :active, :boolean
  end
end
