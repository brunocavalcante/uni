class Student::LessonsController < ApplicationController
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find params[:lecture_id]
  end
  
  def index
    @lessons = Lesson.paginate :conditions => ['lecture_id = ?', @lecture.id], 
                               :page => params[:page], 
                               :order => ['date DESC']
  end
  
  def show
    @lesson = Lesson.find params[:id]
  end
end
