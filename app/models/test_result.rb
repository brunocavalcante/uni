class TestResult < ActiveRecord::Base
  belongs_to :test
  belongs_to :lecture_student
  
  validates_presence_of :test_id, :lecture_student_id, :rating, :date
end
