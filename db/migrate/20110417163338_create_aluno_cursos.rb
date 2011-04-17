class CreateAlunoCursos < ActiveRecord::Migration
  def self.up
    create_table :aluno_cursos do |t|
      t.integer :aluno_id
      t.integer :curso_id

      t.timestamps
    end
  end

  def self.down
    drop_table :aluno_cursos
  end
end
