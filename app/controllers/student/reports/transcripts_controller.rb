class Student::Reports::TranscriptsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_student
  
  def load_student
    @student = Student.find_by_person_id @user.id
  end
 
  def index
    @curriculum_students = @student.curriculum_students.all_with_curriculum.paginate :page => params[:page]
    
    if @curriculum_students.size == 1
      redirect_to({:action => :show, :id => @curriculum_students[0].id}) if @curriculum_students.size == 1
    else
      respond_with @curriculum_students
    end
  end
  
  def show
    @curriculum_student = Transcript.find params[:id]
    @transcripts = @curriculum_student.transcripts
  end
end
