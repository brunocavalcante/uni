class CreateCadeiras < ActiveRecord::Migration
  def self.up
    create_table :cadeiras do |t|
      t.string :nome
      t.integer :creditos
      t.integer :curso_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cadeiras
  end
end
