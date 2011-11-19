class Discipline < ActiveRecord::Base
  belongs_to :course
  
  has_many :curriculum_disciplines, :dependent => :destroy
  has_many :curriculums, :through => :curriculum_disciplines
  has_many :transferred_disciplines, :dependent => :destroy
  has_many :lectures, :dependent => :destroy
  
  default_scope :order => 'name ASC'
  
  scope :latest_versions, where('version = (SELECT MAX(version) 
                                            FROM disciplines d2 
                                            WHERE d2.code = disciplines.code) 
                                 OR version IS NULL').order('name ASC, version ASC')
  
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
  
  def full_name
    "#{code} - #{name} - #{course.name}" 
  end
end
