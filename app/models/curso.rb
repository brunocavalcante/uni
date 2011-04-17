class Curso < ActiveRecord::Base
  default_scope :order => 'nome ASC'
  
  belongs_to :categoria_curso
  
  has_many :cursodisciplinas, :foreign_key => 'curso_id', :class_name => 'CursoDisciplina'
  has_many :disciplinas, :through => :cursodisciplinas
  
  has_many :alunocursos, :foreign_key => 'curso_id', :class_name => 'AlunoCurso'
  has_many :alunos, :through => :alunocursos
end
