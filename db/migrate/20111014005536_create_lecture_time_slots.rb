class CreateLectureTimeSlots < ActiveRecord::Migration
  def self.up
    create_table :lecture_time_slots do |t|
      t.integer :lecture_id
      t.integer :weekday
      t.integer :start_time
      t.integer :end_time
      t.string :rrule

      t.timestamps
    end
  end

  def self.down
    drop_table :lecture_time_slots
  end
end
