class CreateDisciplinePrerequisites < ActiveRecord::Migration
  def change
    create_table :discipline_prerequisites do |t|
      t.integer :discipline_id
      t.integer :dependent_discipline_id

      t.timestamps
    end
  end
end
