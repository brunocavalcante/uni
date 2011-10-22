class Professor::LecturesController < ApplicationController
  before_filter :load_lecture
  
  def load_lecture
    if (params[:id])
      @lecture = Lecture.find(params[:id])
    end
  end
  
  def index
    @professor = Professor.find_by_person_id(@user.id)
    @lectures = @professor.current_lectures
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
  
  def wall
    @wall = Wall.paginate :conditions => ['lecture_id = ?', params[:id]], 
                          :include => [{:message => :person}], 
                          :page => params[:page], 
                          :order => 'created_at DESC'
  end
end
