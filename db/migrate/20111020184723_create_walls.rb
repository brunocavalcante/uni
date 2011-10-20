class CreateWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.integer :message_id
      t.integer :lecture_id

      t.timestamps
    end
  end
end
