class CreateEscolaridades < ActiveRecord::Migration
  def self.up
    create_table :escolaridades do |t|
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :escolaridades
  end
end
