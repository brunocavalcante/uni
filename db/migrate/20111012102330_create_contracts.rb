class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.integer :student_id
      t.string :code
      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
