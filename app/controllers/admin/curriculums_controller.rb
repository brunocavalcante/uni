class Admin::CurriculumsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_course
  
  def load_course
    @course = Course.find(params[:course_id])
  end
  
  # GET /curriculums
  # GET /curriculums.xml
  def index
    @curriculums = @course.curriculums.paginate :page => params[:page]
    
    respond_with @curriculums
  end

  # GET /curriculums/1
  # GET /curriculums/1.xml
  def show
    @curriculum = Curriculum.find(params[:id])
    @curriculum_disciplines = @curriculum.curriculum_disciplines.by_module.paginate :page => params[:page]

    respond_with @curriculum
  end

  # GET /curriculums/new
  # GET /curriculums/new.xml
  def new
    @curriculum = Curriculum.new
    
    respond_with @curriculum
  end

  # GET /curriculums/1/edit
  def edit
    @curriculum = Curriculum.find(params[:id])
  end

  # POST /curriculums
  # POST /curriculums.xml
  def create
    @curriculum = Curriculum.new(params[:curriculum])
    @curriculum.course = @course
    @curriculum.save
    
    respond_with @curriculum, :location => [:admin, @course, @curriculum]
  end

  # PUT /curriculums/1
  # PUT /curriculums/1.xml
  def update
    @curriculum = Curriculum.find(params[:id])
    @curriculum.update_attributes(params[:curriculum])

    respond_with @curriculum, :location => [:admin, @course, @curriculum]
  end

  # DELETE /curriculums/1
  # DELETE /curriculums/1.xml
  def destroy
    @curriculum = Curriculum.find(params[:id])
    @curriculum.destroy
    
    respond_with @curriculum, :location => admin_course_curriculums_url(@course)
  end
end
