class AddActiveToProfessor < ActiveRecord::Migration
  def change
    add_column :professors, :active, :boolean
  end
end
