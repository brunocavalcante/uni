class LectureStudent < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :student
  
  has_many :lecture_student_absences
  
  validates :lecture_id, :presence => true
  validates :student_id, :presence => true
  
  def name
    student.name
  end
  
  def month_absences
    @lecture_student_absences = LectureStudentAbsence.all :conditions => ['lecture_student_id = ?', id], 
                                                          :include => [:lecture_absence], 
                                                          :order => ['lecture_absences.date ASC']
                                                          
    @month_absences = {}
    (lecture.academic_period.start.month .. lecture.academic_period.end.month).each {|i| @month_absences[i] = 0}
    
    for lecture_student_absence in @lecture_student_absences
      @month_absences[lecture_student_absence.lecture_absence.date.month] += lecture_student_absence.ammount
    end
    
    return @month_absences
  end
end
