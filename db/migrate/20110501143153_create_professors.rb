class CreateProfessors < ActiveRecord::Migration
  def self.up
    create_table :professors do |t|
      t.integer :person_id
      t.integer :scholarity_id

      t.timestamps
    end
  end

  def self.down
    drop_table :professors
  end
end
