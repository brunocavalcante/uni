class Professor::LectureStudentsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
  
  def index
    @lecture_students = @lecture.lecture_students.by_name
    
    if params[:term] && params[:term] != ''
      @lecture_students = @lecture_students.where('people.name ILIKE ?', "#{params[:term]}")
    end
    
    if params[:lecture_situation_id] && params[:lecture_situation_id] != ''
      if params[:lecture_situation_id] == "0"
        @lecture_students = @lecture_students.where('lecture_students.lecture_situation_id IS NULL')
      else
        @lecture_students = @lecture_students.where('lecture_students.lecture_situation_id = ?', params[:lecture_situation_id])
      end
    end
    
    @lecture_students = @lecture_students.paginate :page => params[:page]
    
    respond_with @lecture_students
  end
  
  def show
    @lecture_student = LectureStudent.find params[:id]
    @month_absences = @lecture_student.month_absences
    
    respond_with @lecture_student
  end
  
  def edit
    @lecture_student = LectureStudent.find params[:id]
    @attendace_suggestion = nil
    
    @maximum_absences = @lecture.lessons.inject(0) {|sum, lesson| sum + lesson.maximum_absences}
    @absences = @lecture_student.lesson_absences.inject(0) {|sum, absence| sum + absence.ammount}
    
    @suggested_attendance = ((@maximum_absences - @absences) * 100) / @maximum_absences
  end
  
  def update
    @lecture_student = LectureStudent.find(params[:id])
    @lecture_student.update_attributes(params[:lecture_student])
    
    respond_with @lecture_student, :location => {:action => :show}
  end
end
