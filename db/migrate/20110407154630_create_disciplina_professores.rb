class CreateDisciplinaProfessores < ActiveRecord::Migration
  def self.up
    create_table :disciplina_professores do |t|
      t.integer :disciplina_id
      t.integer :professor_id

      t.timestamps
    end
  end

  def self.down
    drop_table :disciplina_professores
  end
end
