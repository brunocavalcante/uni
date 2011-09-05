class Admin::CurriculumDisciplinesController < ApplicationController
  before_filter :init
  
  def init
    @course = Course.find(params[:course_id])
    @curriculum = Curriculum.new({:name => '2008.1', :course => @course})
    @curriculum.id = '12'
  end
  
  def new
  end
  
  def show
    @course = Course.find(params[:course_id])
    @curriculum = Curriculum.find(params[:curriculum_id])
    @curriculum_discipline = CurriculumDiscipline.find(params[:id])
  end
end
