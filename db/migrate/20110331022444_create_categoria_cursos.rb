class CreateCategoriaCursos < ActiveRecord::Migration
  def self.up
    create_table :categoria_cursos do |t|
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :categoria_cursos
  end
end
