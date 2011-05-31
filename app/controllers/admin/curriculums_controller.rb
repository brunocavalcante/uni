class Admin::CurriculumsController < ApplicationController
  before_filter :init

  def init
    @course = Course.find(params[:course_id])
  end

  def index
  end

  def show
  end
end
