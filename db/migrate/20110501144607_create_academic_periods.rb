class CreateAcademicPeriods < ActiveRecord::Migration
  def self.up
    create_table :academic_periods do |t|
      t.string :name
      t.date :start
      t.date :end
      t.date :registration_start
      t.date :registration_end

      t.timestamps
    end
  end

  def self.down
    drop_table :academic_periods
  end
end
