class Discipline < ActiveRecord::Base
  belongs_to :course
  
  has_many :curriculum_disciplines, :dependent => :destroy
  has_many :curriculums, :through => :curriculum_disciplines
  has_many :transferred_disciplines, :dependent => :destroy
  has_many :lectures, :dependent => :destroy
  
  # Discipline that have this one as a equivalent
  has_many :discipline_equivalents_dependencies, 
    :foreign_key => 'equivalent_discipline_id', :class_name => 'DisciplineEquivalent', :dependent => :destroy                             
  has_many :equivalents_dependencies, :through => :discipline_equivalents_dependencies, :source => :discipline

  # This discipline's equivalents
  has_many :discipline_equivalents, 
    :foreign_key => 'discipline_id', :class_name => 'DisciplineEquivalent', :dependent => :destroy                             
  has_many :equivalents, :through => :discipline_equivalents, :source => :equivalent_discipline

  scope :ordered_by_name, order('name ASC')
  
  scope :latest_versions, where('version = (SELECT MAX(version) 
                                            FROM disciplines d2 
                                            WHERE d2.code = disciplines.code) 
                                 OR version IS NULL').order('name ASC, version ASC')
                                 
  scope :where_code_or_name, lambda { |term| 
    where(['disciplines.code = ? OR disciplines.name ILIKE ?', term, "%#{term}%"]) if term != ''
  }
  
  validates :code, :presence => true
  validates :name, :presence => true
  validates :version, :presence => true
  
  validates_uniqueness_of :code, :scope => :version
  
  def versions
    Discipline.find(:all, :conditions => ["code = ? and course_id = ?", code, course.id], :order => 'version DESC')
  end
  
  def version_fullname
    "#{version.to_s} (#{I18n.l(created_at)})"
  end
  
  def version_shortname
    "#{version.to_s} (#{I18n.l(created_at, :format => :short)})"
  end
  
  def get(attr)
    self.send(attr)
  end
  
  def full_name
    "#{code} - #{name} - #{course.name}" 
  end
  
  def equivalents_codes
    equivalents_codes = []
    for e in equivalents | equivalents_dependencies
      equivalents_codes << e.code
    end
    
    return equivalents_codes
  end
end
