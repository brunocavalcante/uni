class Admin::CurriculumStudentsController < ApplicationController
  before_filter :init
  
  def init
    @course = Course.find(params[:course_id])
  end
  
  def index
    @conditions = ['curriculums.course_id = ?', params[:course_id]]
    
    if params[:search]
      @conditions = ['curriculums.course_id = ? AND (people.name ILIKE ? OR students.code = ?)', 
                     params[:course_id], "%#{params[:search]}%", params[:search]]
    end
    
    @curriculum_students = CurriculumStudent.paginate :conditions => @conditions, 
                                                      :include => [:curriculum, {:student => :person}], 
                                                      :page => params[:page]
                                                      
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @curriculum_students }
      format.json { render :json => @curriculum_students }
    end
  end
  
  def new
    @curriculum_student = CurriculumStudent.new
    @curriculum_student.active = true
  end
  
  def create
    @curriculum_student = CurriculumStudent.new(params[:curriculum_student])
    
    respond_to do |format|
      if @curriculum_student.save
        format.html { redirect_to({:action => "index"}, :notice => (t 'CurriculumStudentAdded')) }
        format.xml  { render :xml => @curriculum_student, :status => :created, :location => @curriculum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @curriculum_student.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @curriculum_student = CurriculumStudent.find params[:id]
  end
  
  def edit
    @curriculum_student = CurriculumStudent.find params[:id]
  end
  
  def update
    @curriculum_student = CurriculumStudent.find params[:id]
    
    respond_to do |format|
      if @curriculum_student.update_attributes params[:curriculum_student]
        format.html { redirect_to({:action => "show"}, :notice => (t 'StudentUpdated')) }
        format.xml  { render :xml => @curriculum_student, :status => :created, :location => @curriculum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @curriculum_student.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @curriculum_student = CurriculumStudent.find(params[:id])
    @curriculum_student.destroy

    respond_to do |format|
      format.html { redirect_to({:action => "index"}, :notice => (t 'CurriculumStudentRemoved')) }
      format.xml  { head :ok }
    end
  end
end
