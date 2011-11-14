class AddSyllabusToDiscipline < ActiveRecord::Migration
  def change
    add_column :disciplines, :syllabus, :string
  end
end
