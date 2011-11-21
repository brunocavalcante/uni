class Professor::AbsencesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_lesson
  
  def load_lesson
    @lecture = Lecture.find params[:lecture_id]
    @lesson = Lesson.find params[:lesson_id]
  end
  
  def index
    load_students  
  end
  
  def load_students
    @lecture_students = @lecture.lecture_students.by_name
    @lesson_absences = @lesson.lesson_absences.by_student_name
                                          
    @absences = {}
    @lecture_students.each { |lecture_student| @absences[lecture_student.id] = 0 }
    @lesson_absences.each { |lesson_absence| @absences[lesson_absence.lecture_student_id] = lesson_absence.ammount }
  end
  
  def create
    @lesson_absences = []
    
    (0..params[:lecture_student_id].size - 1).each do |i| 
      @lesson_absence = LessonAbsence.new
      @lesson_absence.lecture_student_id = params[:lecture_student_id][i]
      @lesson_absence.ammount = params[:lecture_student_ammount][i]
      @lesson_absences << @lesson_absence
    end
    
    @lesson.lesson_absences = @lesson_absences
    
    flash[:notice] = I18n.t('LessonAbsencesUpdated') if @lesson.save
    
    respond_with @lesson, :location => {:action => "index"}
  end
end
