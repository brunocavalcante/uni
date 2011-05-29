class CreateDisciplines < ActiveRecord::Migration
  def self.up
    create_table :disciplines do |t|
      t.integer :course_id
      t.string :code
      t.string :name
      t.integer :version
      t.integer :credits

      t.timestamps
    end
  end

  def self.down
    drop_table :disciplines
  end
end
