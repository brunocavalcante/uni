class CreatePeriodos < ActiveRecord::Migration
  def self.up
    create_table :periodos do |t|
      t.string :nome
      t.date :inicio
      t.date :fim
      t.date :iniciomatricula
      t.date :fimmatricula

      t.timestamps
    end
  end

  def self.down
    drop_table :periodos
  end
end
