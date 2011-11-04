class Curriculum < ActiveRecord::Base
  belongs_to :course
  has_many :curriculum_disciplines, :dependent => :destroy
  has_many :disciplines, :through => :curriculum_disciplines
  
  has_many :curriculum_students, :dependent => :destroy
  
  validates :code, :presence => true
  validates :name, :presence => true
  
  validates_uniqueness_of :code, :scope => :course_id
end
