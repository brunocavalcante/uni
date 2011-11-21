class Admin::CurriculumStudentsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :init
  
  def init
    @course = Course.find(params[:course_id])
  end
  
  def index
    @curriculum_students = CurriculumStudent.all_with_person_and_curriculum
                                            .where('curriculums.course_id = ?', params[:course_id])
    
    if params[:search] && params[:search] != ''
      @curriculum_students = @curriculum_students.where(['people.name ILIKE ? OR students.code = ?', 
                                                         "%#{params[:search]}%", 
                                                         params[:search]]) 
    end
    
    @curriculum_students = @curriculum_students.paginate :page => params[:page]

    respond_with @curriculum_students
  end
  
  def new
    @curriculum_student = CurriculumStudent.new
    @curriculum_student.active = true
    
    respond_with @curriculum_student
  end
  
  def create
    @curriculum_student = CurriculumStudent.new(params[:curriculum_student])
    @curriculum_student.save
    
    respond_with @curriculum_student, :location => {:action => :index}
  end
  
  def show
    @curriculum_student = CurriculumStudent.find params[:id]
    
    respond_with @curriculum_student
  end
  
  def edit
    @curriculum_student = CurriculumStudent.find params[:id]
  end
  
  def update
    @curriculum_student = CurriculumStudent.find params[:id]
    @curriculum_student.update_attributes params[:curriculum_student]
    
    respond_with @curriculum_student, :location => {:action => :show}
  end
  
  def destroy
    @curriculum_student = CurriculumStudent.find(params[:id])
    @curriculum_student.destroy

    respond_with @curriculum_student, :location => {:action => "index"}
  end
end
