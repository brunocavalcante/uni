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
    @lecture_student = LectureStudent.new(params[:lecture_student])
    @lecture_student.lecture = @lecture
    @lecture_student.student = Student.find_by_code(params[:student_code])
    
    respond_to do |format|
      if @lecture_student.save
        format.html { redirect_to([:admin, @academic_period, @lecture], :notice => 'Student was successfully created.') }
        format.xml  { render :xml => @lecture_student, :status => :created, :location => @discipline }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lecture_student.errors, :status => :unprocessable_entity }
      end
    end
  end
end
