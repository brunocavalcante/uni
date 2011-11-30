class CurriculumModule < ActiveRecord::Base
  belongs_to :curriculum
  
  has_many :curriculum_discipline, :dependent => :nullify
  
  validates_presence_of :name
  
  scope :by_order, order('curriculum_modules.order ASC')
end
