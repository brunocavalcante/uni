class Disciplina < ActiveRecord::Base
  default_scope :order => 'nome ASC'
  
  has_many :cursodisciplinas, :foreign_key => 'disciplina_id', :class_name => 'CursoDisciplina'
  has_many :cursos, :through => :cursodisciplinas
  
  has_many :depends, :foreign_key => 'disciplina_id', :class_name => 'Prerequisito'
  has_many :prerequisitos, :through => :depends, :source => :requisito
  
  validates :codigo, :presence => true
  validates :nome, :presence => true
  validate :validate_cursos

  def validate_cursos
    errors.add(:cursos, "por favor, selecione pelo menos um curso") if cursos.length == 0
  end
end
