class Student < ActiveRecord::Base
  belongs_to :person
  has_many :curriculum_students
  has_many :curriculums, :through => :curriculum_students
  
  accepts_nested_attributes_for :person
    
  def to_param
    code
  end
    
  def name
    person.name
  end
end
