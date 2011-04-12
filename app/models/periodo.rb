class Periodo < ActiveRecord::Base
  validates :nome, :presence => true
  validates :inicio, :presence => true
  validates :fim, :presence => true
end
