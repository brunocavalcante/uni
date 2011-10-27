class LectureStudent < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :student
  
  has_many :lecture_student_absences
  
  validates :lecture_id, :presence => true
  validates :student_id, :presence => true
  
  def name
    student.name
  end
end
