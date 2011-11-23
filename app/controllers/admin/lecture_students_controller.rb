class Admin::LectureStudentsController < ApplicationController
  respond_to :html, :xml, :json
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
      
      redirect_to([:admin, @academic_period, @lecture], :notice => I18n.t('flash.admin.lecture_students.create.notice', :resource_name => I18n.t('Students')))
    rescue
      @lecture_student = LectureStudent.new
      @lecture_student.errors.add_on_empty [:student_id]
      render :action => "new"
    end
  end
  
  def destroy
    @lecture_student = LectureStudent.find(params[:id])
    @lecture_student.destroy

    respond_with @lecture_student, :location => [:admin, @academic_period, @lecture]
  end
end
