class Admin::DisciplinesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_course
  
  def load_course
    @course = Course.find(params[:course_id])
  end
  
  # GET /disciplines
  # GET /disciplines.xml
  def index
    @disciplines = @course.disciplines.latest_versions.paginate :page => params[:page] 
    
    respond_with @disciplines
  end

  # GET /disciplines/1
  # GET /disciplines/1.xml
  def show
    @discipline = Discipline.find(params[:id])

    respond_with @discipline
  end

  # GET /disciplines/new
  # GET /disciplines/new.xml
  def new
    @discipline = Discipline.new
    
    respond_with @discipline
  end

  # GET /disciplines/1/edit
  def edit
    @discipline = Discipline.find(params[:id])
  end

  # POST /disciplines
  # POST /disciplines.xml
  def create
    @discipline = Discipline.new(params[:discipline])
    @discipline.course = @course
    @discipline.version = 1
    
    flash[:notice] = I18n.t('DisciplineCreated') if @discipline.save
    
    respond_with @discipline, :location => [:admin, @course, @discipline]
  end

  # PUT /disciplines/1
  # PUT /disciplines/1.xml
  def update
    @discipline = Discipline.find(params[:id])
    @new_discipline = Discipline.new(params[:discipline])
    @new_discipline.code = @discipline.code
    @new_discipline.course = @discipline.course
    @new_discipline.version = @discipline.version + 1
    
    @changed = false

    for field_to_check in ['syllabus', 'credits', 'name', 'equivalent_ids']
      @changed = true if @new_discipline.get(field_to_check) != @discipline.get(field_to_check)
    end

    if @changed
      flash[:notice] = I18n.t('DisciplineUpdated') if @new_discipline.save
    
      respond_with @new_discipline, :location => [:admin, @course, @new_discipline]      
    else
      respond_with @discipline, :location => [:admin, @course, @discipline]
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.xml
  def destroy
    @discipline = Discipline.find(params[:id])
    
    flash[:notice] = I18n.t('DisciplineDeleted') if @discipline.destroy
    
    respond_with @discipline, :location => admin_course_disciplines_url(@course)
  end
end
