class Curriculum < ActiveRecord::Base
  belongs_to :course
  has_many :curriculum_disciplines, :dependent => :destroy
  has_many :disciplines, :through => :curriculum_disciplines
  
  has_many :curriculum_students, :dependent => :destroy
  
  has_many :curriculum_modules, :dependent => :destroy
  
  validates :code, :presence => true
  validates :name, :presence => true
  
  scope :by_activeness, order('curriculums.active ASC, curriculums.created_at DESC')
  
  validates_uniqueness_of :code, :scope => :course_id
end
