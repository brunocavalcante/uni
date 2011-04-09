class Aluno < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :curso
  
  accepts_nested_attributes_for :pessoa
  
  validates :curso_id, :presence => true
  validates :pessoa_id, :presence => true
  validates :matricula, :presence => true, :uniqueness => true
  
  def to_param
    matricula
  end
  
  def nome
    pessoa.nome
  end
end
