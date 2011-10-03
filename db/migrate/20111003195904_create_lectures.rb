class CreateLectures < ActiveRecord::Migration
  def self.up
    create_table :lectures do |t|
      t.integer :discipline_id
      t.integer :professor_id
      t.integer :academic_period_id
      t.string :code
      t.integer :places

      t.timestamps
    end
  end

  def self.down
    drop_table :lectures
  end
end
