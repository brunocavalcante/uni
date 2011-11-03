class LectureStudent < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :student
  belongs_to :lecture_situation
  
  has_many :lesson_absences
  
  validates :lecture_id, :presence => true
  validates :student_id, :presence => true
  
  validates_presence_of :grade, :if => :lecture_situation_id?
  validates_presence_of :attendance, :if => :lecture_situation_id?
  validates_presence_of :lecture_situation_id, :if => :grade? || :attendance?
  
  def name
    student.name
  end
  
  def month_absences
    @lesson_absences = LessonAbsence.all :conditions => ['lecture_student_id = ?', id], 
                                         :include => [:lesson], 
                                         :order => ['lessons.date ASC']
                                                          
    @month_absences = {}
    (lecture.academic_period.start.month .. lecture.academic_period.end.month).each {|i| @month_absences[i] = nil}
    
    for lesson_absence in @lesson_absences
      if @month_absences[lesson_absence.lesson.date.month] == nil
        @month_absences[lesson_absence.lesson.date.month] = 0
      end
      @month_absences[lesson_absence.lesson.date.month] += lesson_absence.ammount
    end
    
    return @month_absences
  end
end
