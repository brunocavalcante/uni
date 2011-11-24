class AddScholarityIdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :scholarity_id, :integer
    remove_column :professors, :scholarity_id
  end
end
