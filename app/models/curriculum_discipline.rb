class CurriculumDiscipline < ActiveRecord::Base
  belongs_to :curriculum
  belongs_to :discipline
  belongs_to :curriculum_module
  
  # Discipline that have this one as a prerequisite
  has_many :curriculum_discipline_prerequisites_dependencies, 
    :foreign_key => 'dependent_curriculum_discipline_id', :class_name => 'CurriculumDisciplinePrerequisite', :dependent => :destroy                             
  has_many :prerequisites_dependencies, :through => :curriculum_discipline_prerequisites_dependencies, :source => :curriculum_discipline

  # This discipline's prerequisites
  has_many :curriculum_discipline_prerequisites, 
    :foreign_key => 'curriculum_discipline_id', :class_name => 'CurriculumDisciplinePrerequisite', :dependent => :destroy                             
  has_many :prerequisites, :through => :curriculum_discipline_prerequisites, :source => :dependent_curriculum_discipline
  
  # Scopes
  scope :by_module, includes([:discipline, :curriculum_module]).order('curriculum_modules.order ASC, disciplines.name ASC')
  scope :with_prerequisites, includes(:prerequisites)
  
  # Validations
  validate :validate_curriculum
  
  def validate_curriculum
    errors.add(:curriculum_id, :finished) if curriculum.finished? 
  end
  
  def name
    discipline.name
  end
  
  before_save :check_circular_dependencies
  
  def check_circular_dependencies
    if prerequisites.exists?
      for current_prerequisite in prerequisites
        if current_prerequisite.id == id
          errors.add(:prerequisites, :depending_on_itself)
          return false
        end
        if !check_circular_dependencies_against(current_prerequisite)
          return false
        end
      end
    end
    true
  end
  
  def check_circular_dependencies_against(dependent_cdiscipline)
    if dependent_cdiscipline.prerequisites.exists?
      for current_prerequisite in dependent_cdiscipline.prerequisites
        if current_prerequisite.id == id
          errors.add(:prerequisites, :circular_dependency, :discipline_name => dependent_cdiscipline.name)
          return false
        end
        return check_circular_dependencies_against(current_prerequisite)
      end
    end
    true
  end
end
