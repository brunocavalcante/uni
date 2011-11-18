class Student::Reports::TranscriptsController < ApplicationController
  before_filter :load_student
  
  def load_student
    @student = Student.find_by_person_id @user.id
  end
 
  def index
    @curriculum_students = @student.curriculum_students.all_with_curriculum.paginate :page => params[:page]
    
    redirect_to({:action => :show, :id => @curriculum_students[0].id}) if @curriculum_students.size == 1
  end
  
  def show
    @curriculum_student = CurriculumStudent.find params[:id]
    @transcripts = @curriculum_student.transcripts
  end
end
