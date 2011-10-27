class LecturesController < ApplicationController
  before_filter :load_lecture
  
  def load_lecture
    if (params[:id])
      @lecture = Lecture.find(params[:id])
    end
  end
  
  def show
    @wall = Wall.paginate :conditions => ['lecture_id = ?', params[:id]], 
                          :include => [{:message => :person}], 
                          :page => params[:page], 
                          :order => 'created_at DESC'
                          
    @files = LectureFile.paginate :conditions => ['lecture_id = ?', params[:id]], 
                                  :include => [:person], 
                                  :page => params[:page], 
                                  :order => 'created_at DESC'
                          
    @updates = @wall | @files
    
    @updates.sort! { |a,b| a.created_at <=> b.created_at }
    @updates.reverse!
  end
  
  def details
    
  end
end
