class Admin::CurriculumsController < ApplicationController
  before_filter :init

  def init
    @course = Course.find(params[:course_id])
    @curriculum = Curriculum.new({:name => '2008.1', :course => @course})
    @curriculum.id = '12'
  end

  def index
  end

  def show
  end
end