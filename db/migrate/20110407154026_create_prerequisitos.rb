class CreatePrerequisitos < ActiveRecord::Migration
  def self.up
    create_table :prerequisitos do |t|
      t.integer :disciplina_id
      t.integer :requisito_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prerequisitos
  end
end
