class CreateProfessorCursos < ActiveRecord::Migration
  def self.up
    create_table :professor_cursos do |t|
      t.integer :professor_id
      t.integer :curso_id

      t.timestamps
    end
  end

  def self.down
    drop_table :professor_cursos
  end
end
