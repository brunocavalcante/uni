class LessonAbsence < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :lecture_student
  
  validates_presence_of :ammount
end
