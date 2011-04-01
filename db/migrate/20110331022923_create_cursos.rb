class CreateCursos < ActiveRecord::Migration
  def self.up
    create_table :cursos do |t|
      t.string :nome
      t.integer :categoria_curso_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cursos
  end
end
