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
    @updates = @wall
  end
  
  def details
    
  end
  
  def students
    @lecture_students = LectureStudent.paginate :conditions => ['lecture_id = ?', params[:id]], 
                                                :include => [{:student => :person}], 
                                                :page => params[:page], 
                                                :order => 'students.name ASC'
  end
  
  def files
    
  end
end
