class Lesson < ActiveRecord::Base
  belongs_to :lecture
  
  has_many :lesson_absences, :dependent => :destroy
  
  validates_presence_of :date
  
  def name
    return title ? title : (l date, :format => :long)
  end
end
