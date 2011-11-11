class Admin::DisciplinesController < ApplicationController
  before_filter :load_course
  
  def load_course
    @course = Course.find(params[:course_id])
  end
  
  # GET /disciplines
  # GET /disciplines.xml
  def index
    @disciplines = Discipline.paginate :conditions => ['course_id = ? AND 
                                                       (version = (SELECT MAX(version) 
                                                                  FROM disciplines d2 
                                                                  WHERE d2.code = disciplines.code) OR 
                                                        version IS NULL)', 
                                                       params[:course_id]], 
                                       :page => params[:page], 
                                       :order => 'name ASC, version ASC'
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @disciplines }
      format.json { render :json => @disciplines }
    end
  end

  # GET /disciplines/1
  # GET /disciplines/1.xml
  def show
    @discipline = Discipline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @discipline }
      format.json { render :json => @discipline }
    end
  end

  # GET /disciplines/new
  # GET /disciplines/new.xml
  def new
    @discipline = Discipline.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @discipline }
    end
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
    
    respond_to do |format|
      if @discipline.save
        format.html { redirect_to([:admin, @course, @discipline], :notice => 'Discipline was successfully created.') }
        format.xml  { render :xml => @discipline, :status => :created, :location => @discipline }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @discipline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /disciplines/1
  # PUT /disciplines/1.xml
  def update
    @discipline = Discipline.find(params[:id])
    @new_discipline = Discipline.new(params[:discipline])
    @new_discipline.code = @discipline.code
    @new_discipline.course = @discipline.course
    @new_discipline.version = @discipline.version + 1

    respond_to do |format|
      if @new_discipline.save
        format.html { redirect_to([:admin, @course, @new_discipline], :notice => 'Discipline was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @discipline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.xml
  def destroy
    @discipline = Discipline.find(params[:id])
    @discipline.destroy
    
    respond_to do |format|
      format.html { redirect_to(admin_course_disciplines_url(@course)) }
      format.xml  { head :ok }
    end
  end
end
