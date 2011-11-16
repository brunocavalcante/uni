class CurriculumDiscipline < ActiveRecord::Base
  belongs_to :curriculum
  belongs_to :discipline
  
  # Discipline that have this one as a prerequisite
  has_many :curriculum_discipline_prerequisites_dependencies, 
    :foreign_key => 'dependent_curriculum_discipline_id', :class_name => 'CurriculumDisciplinePrerequisite', :dependent => :destroy                             
  has_many :prerequisites_dependencies, :through => :curriculum_discipline_prerequisites_dependencies, :source => :curriculum_discipline

  # This discipline's prerequisites
  has_many :curriculum_discipline_prerequisites, 
    :foreign_key => 'curriculum_discipline_id', :class_name => 'CurriculumDisciplinePrerequisite', :dependent => :destroy                             
  has_many :prerequisites, :through => :curriculum_discipline_prerequisites, :source => :dependent_curriculum_discipline
  
  validate :validate_curriculum
  
  def validate_curriculum
    errors.add(:curriculum_id, :active) if curriculum.active? 
  end
  
  def name
    discipline.name
  end
end
