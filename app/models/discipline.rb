class Discipline < ActiveRecord::Base
  belongs_to :course
  has_many :curriculum_disciplines, :dependent => :destroy
  has_many :curriculums, :through => :curriculum_disciplines
  
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
end
