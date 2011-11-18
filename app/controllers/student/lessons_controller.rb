class Student::LessonsController < ApplicationController
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find params[:lecture_id]
  end
  
  def index
    @lessons = @lecture.lessons.paginate :page => params[:page]
  end
  
  def show
    @lesson = Lesson.find params[:id]
  end
end
