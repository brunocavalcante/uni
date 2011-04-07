class DisciplinaProfessor < ActiveRecord::Base
  belongs_to :disciplina
  belongs_to :professor
end
