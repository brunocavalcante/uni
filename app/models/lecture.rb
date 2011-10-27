class Lecture < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :academic_period
  belongs_to :lecture_situation
  
  has_many :lecture_time_slots
  
  has_many :lecture_professors
  has_many :professors, :through => :lecture_professors
  
  has_many :lecture_students
  has_many :students, :through => :lecture_students
  
  has_many :lecture_absences
  
  validates :code, :presence => true
  validates :discipline_id, :presence => true
  validates :professor_ids, :presence => true
  validates :academic_period_id, :presence => true
  
  def name
    discipline.name
  end
end
