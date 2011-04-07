class Prerequisito < ActiveRecord::Base
  belongs_to :disciplina
  belongs_to :requisito, :class_name => 'Disciplina'
end
