class ProfessorCurso < ActiveRecord::Base
    belongs_to :professor
    belongs_to :curso
end
