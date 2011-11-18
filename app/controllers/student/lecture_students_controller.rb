class Student::LectureStudentsController < ApplicationController
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
  
  def index
    @lecture_students = @lecture.lecture_students.by_name.paginate :page => params[:page]
  end
end
