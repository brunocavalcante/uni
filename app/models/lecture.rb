class Lecture < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :professor
  belongs_to :academic_period
  
  validates :code, :presence => true
  validates :discipline_id, :presence => true
  validates :professor_id, :presence => true
  validates :academic_period_id, :presence => true
end
