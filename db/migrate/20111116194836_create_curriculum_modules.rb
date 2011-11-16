class CreateCurriculumModules < ActiveRecord::Migration
  def change
    create_table :curriculum_modules do |t|
      t.integer :curriculum_id
      t.string :name
      t.integer :order

      t.timestamps
    end
  end
end
