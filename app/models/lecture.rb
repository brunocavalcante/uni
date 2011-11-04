class Lecture < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :academic_period
  belongs_to :lecture_situation
  
  has_many :lecture_time_slots, :dependent => :destroy
  
  has_many :lecture_professors, :dependent => :destroy
  has_many :professors, :through => :lecture_professors
  
  has_many :lecture_students, :dependent => :destroy
  has_many :students, :through => :lecture_students
  
  has_many :lessons, :dependent => :destroy
  
  has_many :lecture_files, :dependent => :destroy
  has_many :walls, :dependent => :destroy
  
  validates :code, :presence => true
  validates :discipline_id, :presence => true
  validates :professor_ids, :presence => true
  validates :academic_period_id, :presence => true
  
  def name
    discipline.name
  end
end
