class CreateAlunos < ActiveRecord::Migration
  def self.up
    create_table :alunos do |t|
      t.integer :pessoa_id
      t.string :matricula

      t.timestamps
    end
  end

  def self.down
    drop_table :alunos
  end
end
