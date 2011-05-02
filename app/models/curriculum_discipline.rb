class CurriculumDiscipline < ActiveRecord::Base
  belongs_to :curriculum
  belongs_to :discipline
  
  has_many :depends, :foreign_key => 'curriculum_discipline_id', :class_name => 'Prerequisite'
  has_many :prerequisitos, :through => :depends, :source => :curriculum_discipline_prerequisite
end
