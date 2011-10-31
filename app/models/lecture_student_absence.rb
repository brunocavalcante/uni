class LectureStudentAbsence < ActiveRecord::Base
  belongs_to :lecture_absence
  belongs_to :lecture_student
  
  validates_presence_of :lecture_student_id, :ammount
end
