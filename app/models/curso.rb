class Curso < ActiveRecord::Base
  default_scope :order => 'nome ASC'
  
  belongs_to :categoria_curso
  has_many :disciplinas
  has_many :professorescurso, :class_name => 'ProfessorCurso'
  has_many :professores, :through => :professorescurso, :source => :professor
end
