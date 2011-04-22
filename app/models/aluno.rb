class Aluno < ActiveRecord::Base
  belongs_to :pessoa
  has_many :alunocursos, :foreign_key => 'aluno_id', :class_name => 'AlunoCurso'
  has_many :cursos, :through => :alunocursos
  
  accepts_nested_attributes_for :pessoa
    
  def to_param
    matricula
  end
    
  def nome
    pessoa.nome
  end
end
