class Student::ReportsController < ApplicationController
  before_filter :load_student
  
  def load_student
    @student = Student.find_by_person_id @user.id
  end
  
  def transcripts
    @curriculum_student = @student.curriculum_students[0]
    @transcripts = @curriculum_student.transcripts 
  end
  
  def tests_and_abscences
    @lecture_students = @student.current_lecture_students
    
    @month_absences = []
    @lecture_students.each {|lecture_student| @month_absences << lecture_student.month_absences}
  end
  
  def schedule
    @lectures = @student.current_lectures
    @schedule = @student.schedule
  end
end
