class AddDateToTest < ActiveRecord::Migration
  def change
    add_column :tests, :date, :datetime
    remove_column :tests, :scheduled_date
  end
end
