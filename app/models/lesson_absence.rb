class LessonAbsence < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :lecture_student
  
  validates_presence_of :ammount
  
  scope :by_student_name, includes({:lecture_student => {:student => :person}}).order('people.name ASC')
end
