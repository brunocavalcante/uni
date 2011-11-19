class CurriculumStudent < ActiveRecord::Base
  belongs_to :curriculum
  belongs_to :student
  
  validates :curriculum_id, :presence => true
  validates :student_id, :presence => true
  
  has_many :transferred_disciplines, :dependent => :destroy
  
  scope :all_with_curriculum, includes(:curriculum).order('curriculums.name ASC')
  scope :all_with_person_and_curriculum, includes([:curriculum, {:student => :person}]).order('people.name ASC')
  
  validates_uniqueness_of :student_id, :scope => :curriculum_id
  
  def name
    student.name
  end
  
  def to_xml(options = {})
    options[:include] ||= {:student => {:include => :person}}
    
    super(options)
  end
  
  def as_json(options = {})
    options[:include] ||= {:student => {:include => :person}}
    
    super(options)
  end
end
