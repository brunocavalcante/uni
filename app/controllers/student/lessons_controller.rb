class Student::LessonsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find params[:lecture_id]
  end
  
  def index
    @lessons = @lecture.lessons.paginate :page => params[:page]
    
    respond_with @lessons
  end
  
  def show
    @lesson = Lesson.find params[:id]
    
    respond_with @lesson
  end
end
