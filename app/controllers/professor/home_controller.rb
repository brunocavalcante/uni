class Professor::HomeController < ApplicationController
  def index
    @professor = Professor.find_by_person_id(@user.id)
    @lectures = @professor.current_lectures
    
    @wall = Wall.paginate :conditions => ['lecture_id IN (?)', @lectures.map(&:id)], 
                          :include => [{:message => :person}], 
                          :page => params[:page], 
                          :order => 'walls.created_at DESC'
                          
    @files = LectureFile.paginate :conditions => ['lecture_id IN (?)', @lectures.map(&:id)], 
                                  :include => [:person], 
                                  :page => params[:page], 
                                  :order => 'lecture_files.created_at DESC'
                          
    @updates = @wall | @files
    
    @updates.sort! { |a,b| a.created_at <=> b.created_at }
    @updates.reverse!
  end
end
