class Course < ActiveRecord::Base
  belongs_to :course_category
  
  has_many :curriculums, :dependent => :destroy
  has_many :disciplines, :dependent => :destroy
  
  default_scope :order => 'name ASC'
  
  scope :with_category, includes(:course_category).order('name ASC')
  
  validates :code, :presence => true
  validates :name, :presence => true
  
  validates_uniqueness_of :code
  
  def to_xml(options = {})
    options[:include] ||= :course_category
    
    super(options)
  end
  
  def as_json(options = {})
    options[:include] ||= :course_category
    
    super(options)
  end
end
