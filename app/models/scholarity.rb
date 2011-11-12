class Scholarity < ActiveRecord::Base
  has_many :professors
  
  validates :name, :presence => true
end
