class AddEndDateToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :end_date, :date
  end
end
