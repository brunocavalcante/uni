class AddFinishedToCurriculum < ActiveRecord::Migration
  def change
    add_column :curriculums, :finished, :boolean
  end
end
