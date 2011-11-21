class LecturesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_lecture
  
  def load_lecture
    if (params[:id])
      @lecture = Lecture.find(params[:id])
    end
  end
  
  def show
    @updates = Update::LectureUpdate.new.updates(@lecture)
    
    respond_with @lecture
  end
  
  def details
    respond_with @lecture
  end
end
