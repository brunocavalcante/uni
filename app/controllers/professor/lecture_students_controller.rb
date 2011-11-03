class Professor::LectureStudentsController < ApplicationController
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
  
  def index
    @lecture_students = LectureStudent.paginate :conditions => ['lecture_id = ?', params[:lecture_id]], 
                                                :include => [{:student => :person}], 
                                                :page => params[:page], 
                                                :order => 'people.name ASC'
  end
  
  def show
    @lecture_student = LectureStudent.find params[:id]
    @month_absences = @lecture_student.month_absences
  end
  
  def edit
    @lecture_student = LectureStudent.find params[:id]
    @attendace_suggestion = nil
    
    @maximum_absences = @lecture.lessons.inject(0) {|sum, lesson| sum + lesson.maximum_absences}
    @absences = @lecture_student.lesson_absences.inject(0) {|sum, absence| sum + absence.ammount}
    
    @suggested_attendance = ((@maximum_absences - @absences) * 100) / @maximum_absences
  end
  
  def update
    @lecture_student = LectureStudent.find(params[:id])

    respond_to do |format|
      if @lecture_student.update_attributes(params[:lecture_student])
        format.html { redirect_to({:action => "show"}, :notice => 'Object was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lecture_student.errors, :status => :unprocessable_entity }
      end
    end
  end
end
