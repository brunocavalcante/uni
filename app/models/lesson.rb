class Lesson < ActiveRecord::Base
  belongs_to :lecture
  
  has_many :lesson_absences, :dependent => :destroy
  
  default_scope :order => 'date ASC'
  
  validates_presence_of :date
  
  def name
    return title != '' ? title : (I18n.t 'LessonFrom') + ' ' + (I18n.l date, :format => :long)
  end
end
