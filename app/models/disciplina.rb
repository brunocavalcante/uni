class Disciplina < ActiveRecord::Base
  belongs_to :curso
  has_many :depends, :foreign_key => 'disciplina_id', :class_name => 'Prerequisito'
  has_many :prerequisitos, :through => :depends, :source => :requisito
  has_many :disciplina_professores
  has_many :professores, :through => :disciplina_professores
  
  accepts_nested_attributes_for :professores
end
