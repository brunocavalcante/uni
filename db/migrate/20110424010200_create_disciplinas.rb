class CreateDisciplinas < ActiveRecord::Migration
  def self.up
    create_table :disciplinas do |t|
      t.string :nome
      t.string :codigo

      t.timestamps
    end
  end

  def self.down
    drop_table :disciplinas
  end
end
