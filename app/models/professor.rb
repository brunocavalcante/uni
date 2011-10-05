class Professor < ActiveRecord::Base
  belongs_to :person
  belongs_to :scholarity
  has_many :lectures, :dependent => :destroy

  accepts_nested_attributes_for :person
  
  def name
    person.name
  end
end
