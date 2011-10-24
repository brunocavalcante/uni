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
  
  def current_lectures
    @today = Date.today.to_s
    Lecture.all :conditions => ['lectures.id IN (?) AND academic_periods.start <= ? AND academic_periods.end >= ?', 
                                lectures.map(&:id), 
                                @today, 
                                @today], 
                :include => [:academic_period, :discipline]
  end
end
