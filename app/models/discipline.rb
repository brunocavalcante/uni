class Discipline < ActiveRecord::Base
  belongs_to :course
  has_many :curriculum_disciplines
  has_many :curriculums, :through => :curriculum_disciplines
  
  default_scope :order => 'name ASC'
  
  validates :code, :presence => true
  validates :name, :presence => true
end
