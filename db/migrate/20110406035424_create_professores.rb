class CreateProfessores < ActiveRecord::Migration
  def self.up
    create_table :professores do |t|
      t.integer :pessoa_id
      t.integer :escolaridade_id

      t.timestamps
    end
  end

  def self.down
    drop_table :professores
  end
end
