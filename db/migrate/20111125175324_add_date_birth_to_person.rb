class AddDateBirthToPerson < ActiveRecord::Migration
  def change
    add_column :people, :date_birth, :date
  end
end
