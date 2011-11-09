class CurriculumStudent < ActiveRecord::Base
  belongs_to :curriculum
  belongs_to :student
  
  validates :curriculum_id, :presence => true
  validates :student_id, :presence => true
  
  validates_uniqueness_of :student_id, :scope => :curriculum_id
  
  def name
    student.name
  end
end
