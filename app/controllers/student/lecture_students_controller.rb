class Student::LectureStudentsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
  
  def index
    @lecture_students = @lecture.lecture_students.by_name.paginate :page => params[:page]
    
    respond_with @lecture_students
  end
end
