class Student::ReportsController < ApplicationController
  before_filter :load_student
  
  def load_student
    @student = Student.find_by_person_id @user.id
  end
  
  def transcripts
    @curriculum_student = @student.curriculum_students[0]
    
    @curriculum_disciplines = CurriculumDiscipline.all :conditions => ['curriculum_id = ?', @curriculum_student.curriculum_id], 
                                                       :include => [:discipline], 
                                                       :order => ['module ASC, disciplines.name ASC']
    
    @lecture_students = LectureStudent.all :conditions => ['student_id = ?', @student.id], 
                                           :include => [{:lecture => [:discipline, :academic_period]}], 
                                           :order => ['academic_periods.start ASC']
                                           
    @transcripts = []
    @curriculum_disciplines.each {|c| @transcripts << {:discipline => c.discipline}}
    
    @best_lecture_students = {}
    for lecture_student in @lecture_students
      discipline_id = lecture_student.lecture.discipline_id
      if !@best_lecture_students[discipline_id] || @best_lecture_students[discipline_id].lecture_situation.approved == false
        @best_lecture_students[discipline_id] = lecture_student
      end
    end
    
    for transcript in @transcripts
      discipline_id = transcript[:discipline].id
      transcript[:lecture_student] = @best_lecture_students[discipline_id] ? @best_lecture_students[discipline_id] : nil
      @best_lecture_students.delete discipline_id
    end
    
    if @best_lecture_students.size > 0
      for lecture_student in @best_lecture_students
        @transcripts << {:discipline => lecture_student.lecture.discipline, :lecture_student => lecture_student}
      end
    end
  end
  
  def tests_and_abscences
    
  end
  
  def timetable
    @lectures = @student.current_lectures
  end
end
