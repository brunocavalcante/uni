class AlunoCurso < ActiveRecord::Base
  belongs_to :aluno
  belongs_to :curso
end
