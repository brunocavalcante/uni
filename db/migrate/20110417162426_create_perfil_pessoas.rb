class CreatePerfilPessoas < ActiveRecord::Migration
  def self.up
    create_table :perfil_pessoas do |t|
      t.integer :pessoa_id
      t.integer :perfil_id

      t.timestamps
    end
  end

  def self.down
    drop_table :perfil_pessoas
  end
end
