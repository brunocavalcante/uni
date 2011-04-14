class CursoDisciplina < ActiveRecord::Base
  belongs_to :curso
  belongs_to :disciplina
end
