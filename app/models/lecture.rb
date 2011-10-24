class Lecture < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :academic_period
  has_many :lecture_time_slots
  has_many :lecture_professors
  has_many :professors, :through => :lecture_professors
  
  validates :code, :presence => true
  validates :discipline_id, :presence => true
  validates :professor_ids, :presence => true
  validates :academic_period_id, :presence => true
  
  def name
    discipline.name
  end
end
