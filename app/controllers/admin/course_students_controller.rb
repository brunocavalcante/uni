class Admin::CourseStudentsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
  end
  
  def show
    
  end
end