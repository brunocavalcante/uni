class Professor < ActiveRecord::Base
  belongs_to :person
  belongs_to :scholarity
  has_many :lecture_professors, :dependent => :destroy
  has_many :lectures, :through => :lecture_professors

  accepts_nested_attributes_for :person
  
  validates_presence_of :email
  validates_presence_of :scholarity
  
  def email
    person.email
  end
  
  def name
    person.name
  end
  
  def to_xml(options = {})
    options[:include] ||= {:person => {:except => :password}}
    
    super(options)
  end
  
  def as_json(options = {})
    options[:include] ||= {:person => {:except => :password}}
    
    super(options)
  end
end
