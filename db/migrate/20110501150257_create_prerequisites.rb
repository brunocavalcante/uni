class CreatePrerequisites < ActiveRecord::Migration
  def self.up
    create_table :prerequisites do |t|
      t.integer :curriculum_discipline_id
      t.integer :curriculum_discipline_prerequisite_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prerequisites
  end
end
