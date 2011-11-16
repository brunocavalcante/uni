class CurriculumDisciplinePrerequisite < ActiveRecord::Base
  belongs_to :curriculum_discipline
  belongs_to :dependent_curriculum_discipline, :class_name => 'CurriculumDiscipline', :foreign_key => 'dependent_curriculum_discipline_id'
  
  validates_presence_of :curriculum_discipline_id, :dependent_curriculum_discipline_id
  
  validates_uniqueness_of :curriculum_discipline_id, :scope => :dependent_curriculum_discipline_id
end
