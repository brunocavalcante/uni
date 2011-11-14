class DisciplinePrerequisite < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :dependent_discipline, :class_name => 'Discipline', :foreign_key => 'dependent_discipline_id'
  
  validates_presence_of :discipline_id, :dependent_discipline_id
end
