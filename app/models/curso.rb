class Curso < ActiveRecord::Base
  default_scope :order => 'nome ASC'
  
  belongs_to :categoria_curso
  
  has_many :cursodisciplinas, :foreign_key => 'curso_id', :class_name => 'CursoDisciplina'
  has_many :disciplinas, :through => :cursodisciplinas
end
