class Admin::LectureStudentsController < ApplicationController
  before_filter :load_academic_period
  before_filter :load_lecture
  
  def load_academic_period
    @academic_period = AcademicPeriod.find(params[:academic_period_id])
  end
  
  def load_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
  
  def new
    @lecture_student = LectureStudent.new
  end
end
