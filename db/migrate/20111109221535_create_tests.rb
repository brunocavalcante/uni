class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :lecture_id
      t.string :name
      t.datetime :scheduled_date

      t.timestamps
    end
  end
end
