class Student::HomeController < ApplicationController
  def index
    @student = Student.find_by_person_id(@user.id)
    @lectures = @student.current_lectures
    
    @wall = Wall.paginate :conditions => ['lecture_id IN (?)', @lectures.map(&:id)], 
                          :include => [{:message => :person}], 
                          :page => params[:page], 
                          :order => 'created_at DESC'
                          
    @files = LectureFile.paginate :conditions => ['lecture_id IN (?)', @lectures.map(&:id)], 
                                  :include => [:person], 
                                  :page => params[:page], 
                                  :order => 'created_at DESC'
                          
    @updates = @wall | @files
    
    @updates.sort! { |a,b| a.created_at <=> b.created_at }
    @updates.reverse!
  end
end
