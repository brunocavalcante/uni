class Prerequisite < ActiveRecord::Base
  belongs_to :curriculum_discipline
  belongs_to :requirement, :class_name => 'Prerequisite'
end
