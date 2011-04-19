class Periodo < ActiveRecord::Base
  validates :nome, :presence => true
  validates :inicio, :presence => true
  validates :fim, :presence => true
  
  validate :validate_matricula
  validate :validate_iniciofimmatricula
  
  def validate_matricula
    errors.add(:iniciomatricula, "período de matrícula inválido") if (iniciomatricula == nil) ^ (fimmatricula == nil) 
  end
  
  def validate_iniciofimmatricula
    if iniciomatricula and fimmatricula and iniciomatricula > fimmatricula
      errors.add('Início da Matrícula', " deve ser anterior ao fim")
    end
  end
end