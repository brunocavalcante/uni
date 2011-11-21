class DisciplineEquivalent < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :equivalent_discipline, :class_name => 'Discipline', :foreign_key => 'equivalent_discipline_id'

  validates_presence_of :discipline_id, :equivalent_discipline_id
end