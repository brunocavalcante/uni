class Admin::CourseStudentsController < ApplicationController
  before_filter :init
  
  def init
    @course = Course.find(params[:course_id])
  end
  
  def index
    @curriculum_students = CurriculumStudent.paginate :conditions => ['curriculums.course_id = ?', params[:course_id]], 
                                                      :include => [:curriculum, {:student => :person}], 
                                                      :page => params[:page]

  end
  
  def new
    @curriculum_student = CurriculumStudent.new  
  end
  
  def create
    @curriculum_student = CurriculumStudent.new(params[:curriculum_student])
    @curriculum_student.student = Student.find_by_code(params[:student_code])
    
    respond_to do |format|
      if @curriculum_student.save
        format.html { redirect_to(:action => "index", :notice => 'Curriculum was successfully created.') }
        format.xml  { render :xml => @curriculum_student, :status => :created, :location => @curriculum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @curriculum_student.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    
  end
end