class CurriculumStudent < ActiveRecord::Base
  belongs_to :curriculum
  belongs_to :student
  
  validates :curriculum_id, :presence => true
  validates :student_id, :presence => true
end
