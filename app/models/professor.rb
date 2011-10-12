class Professor < ActiveRecord::Base
  belongs_to :person
  belongs_to :scholarity
  has_many :lectures, :dependent => :destroy

  accepts_nested_attributes_for :person
  
  validates_presence_of :email
  validates_presence_of :scholarity
  
  def email
    person.email
  end
  
  def name
    person.name
  end
end
