class CreateCurriculums < ActiveRecord::Migration
  def self.up
    create_table :curriculums do |t|
      t.string :code
      t.string :name
      t.boolean :active
      t.integer :course_id

      t.timestamps
    end
  end

  def self.down
    drop_table :curriculums
  end
end
