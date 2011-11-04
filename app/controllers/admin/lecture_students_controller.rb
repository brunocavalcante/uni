class Admin::LectureStudentsController < ApplicationController
  before_filter :load_academic_period
  before_filter :load_lecture
  
  def load_academic_period
    @academic_period = AcademicPeriod.find(params[:academic_period_id])
  end
  
  def load_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
  
  def new
    @lecture_student = LectureStudent.new
  end
  
  def create
    begin
      for i in params[:lecture_student][:student_id]
        next if LectureStudent.find_by_lecture_id_and_student_id(@lecture.id, i)
        
        @lecture_student = LectureStudent.new
        @lecture_student.student_id = i
        @lecture_student.lecture = @lecture
        @lecture_student.save
      end
      
      redirect_to([:admin, @academic_period, @lecture], :notice => 'Students were successfully added to the lecture.')
    rescue
      @lecture_student = LectureStudent.new
      render :action => "new"
    end
  end
  
  def destroy
    @lecture_student = LectureStudent.find(params[:id])
    @lecture_student.destroy

    respond_to do |format|
      format.html { redirect_to([:admin, @academic_period, @lecture], :notice => 'Student was successfully removed.') }
      format.xml  { head :ok }
    end
  end
end
