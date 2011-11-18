class TransferredDiscipline < ActiveRecord::Base
  belongs_to :curriculum_student
  belongs_to :discipline
  
  scope :by_name, includes(:discipline).order('disciplines.name ASC')
  
  validates_presence_of :curriculum_student_id, :discipline_id
  validates_uniqueness_of :discipline_id, :scope => :curriculum_student_id
  
  def name
    discipline.name
  end
end
