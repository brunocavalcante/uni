class Admin::CurriculumsController < ApplicationController
  before_filter :load_course
  
  def load_course
    @course = Course.find(params[:course_id])
  end
  
  # GET /curriculums
  # GET /curriculums.xml
  def index
    @curriculums = Curriculum.paginate :conditions => ['course_id = ?', params[:course_id]], 
                                       :page => params[:page]
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @curriculums }
      format.json { render :json => @curriculums }
    end
  end

  # GET /curriculums/1
  # GET /curriculums/1.xml
  def show
    @curriculum = Curriculum.find(params[:id])
    @curriculum_disciplines = CurriculumDiscipline.paginate :conditions => ['curriculum_id = ?', params[:id]],
                                                            :include => ['discipline'], 
                                                            :page => params[:page], 
                                                            :order => 'disciplines.name ASC'

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @curriculum }
      format.json { render :json => @curriculum }
    end
  end

  # GET /curriculums/new
  # GET /curriculums/new.xml
  def new
    @curriculum = Curriculum.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @curriculum }
    end
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
    
    respond_to do |format|
      if @curriculum.save
        format.html { redirect_to([:admin, @course, @curriculum], :notice => 'Curriculum was successfully created.') }
        format.xml  { render :xml => @curriculum, :status => :created, :location => @curriculum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @curriculum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /curriculums/1
  # PUT /curriculums/1.xml
  def update
    @curriculum = Curriculum.find(params[:id])

    respond_to do |format|
      if @curriculum.update_attributes(params[:curriculum])
        format.html { redirect_to([:admin, @course, @curriculum], :notice => 'Curriculum was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @curriculum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculums/1
  # DELETE /curriculums/1.xml
  def destroy
    @curriculum = Curriculum.find(params[:id])
    @curriculum.destroy
    
    respond_to do |format|
      format.html { redirect_to(admin_course_curriculums_url(@course)) }
      format.xml  { head :ok }
    end
  end
end
