class Curso < ActiveRecord::Base
    belongs_to :categoria_curso
    has_many :cadeiras
    has_many :professorescurso, :class_name => 'ProfessorCurso'
    has_many :professores, :through => :professorescurso, :source => :professor
end
