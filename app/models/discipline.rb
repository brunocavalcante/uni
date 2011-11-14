class Discipline < ActiveRecord::Base
  belongs_to :course
  has_many :curriculum_disciplines, :dependent => :destroy
  has_many :curriculums, :through => :curriculum_disciplines
  
  has_many :transferred_disciplines, :dependent => :destroy
  
  # Discipline that have this one as a prerequisite
  has_many :discipline_prerequisites_dependencies, 
    :foreign_key => 'dependent_discipline_id', :class_name => 'DisciplinePrerequisite', :dependent => :destroy                             
  has_many :prerequisites_dependencies, :through => :discipline_prerequisites_dependencies, :source => :discipline

  # This discipline's prerequisites
  has_many :discipline_prerequisites, 
    :foreign_key => 'discipline_id', :class_name => 'DisciplinePrerequisite', :dependent => :destroy                             
  has_many :prerequisites, :through => :discipline_prerequisites, :source => :dependent_discipline
  
  default_scope :order => 'name ASC'
  
  validates :code, :presence => true
  validates :name, :presence => true
  validates :version, :presence => true
  
  validates_uniqueness_of :code, :scope => :version
  
  def versions
    Discipline.find(:all, :conditions => ["code = ? and course_id = ?", code, course.id])
  end
  
  def version_fullname
    "#{version.to_s} (#{I18n.l(created_at)})"
  end
  
  def get(attr)
    self.send(attr)
  end
end
