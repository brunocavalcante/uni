class CreateCursoDisciplinas < ActiveRecord::Migration
  def self.up
    create_table :curso_disciplinas do |t|
      t.integer :curso_id
      t.integer :disciplina_id

      t.timestamps
    end
  end

  def self.down
    drop_table :curso_disciplinas
  end
end
