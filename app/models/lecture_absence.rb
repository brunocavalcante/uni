class LectureAbsence < ActiveRecord::Base
  belongs_to :lecture
  
  has_many :lecture_student_absences
  
  accepts_nested_attributes_for :lecture_student_absences
  
  validates_presence_of :lecture_id, :date
end
