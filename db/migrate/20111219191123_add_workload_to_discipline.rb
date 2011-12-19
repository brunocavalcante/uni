class AddWorkloadToDiscipline < ActiveRecord::Migration
  def change
    add_column :disciplines, :workload, :integer
  end
end
