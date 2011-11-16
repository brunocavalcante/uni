class CurriculumModule < ActiveRecord::Base
  belongs_to :curriculum
  
  has_many :curriculum_discipline, :dependent => :nullify
  
  validates_presence_of :name
end
