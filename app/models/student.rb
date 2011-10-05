class Student < ActiveRecord::Base
  belongs_to :person
  has_many :curriculum_students, :dependent => :destroy
  has_many :curriculums, :through => :curriculum_students
  
  has_many :lecture_students, :dependent => :destroy
  has_many :lectures, :through => :lecture_students
  
  accepts_nested_attributes_for :person
    
  def to_param
    code
  end

  def name
    person.name
  end
  
  def current_lectures
    @today = Date.today.to_s
    Lecture.all :conditions => ['lectures.id IN (?) AND academic_periods.start <= ? AND academic_periods.end >= ?', 
                                lectures.map(&:id), 
                                @today, 
                                @today], 
                :include => [:academic_period, :discipline]
  end
end
