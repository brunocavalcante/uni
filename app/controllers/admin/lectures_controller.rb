class Admin::LecturesController < ApplicationController
  before_filter :load_academic_period
  
  def load_academic_period
    @academic_period = AcademicPeriod.find(params[:academic_period_id])
  end
  
  def index
    @lectures = Lecture.paginate :conditions => ['academic_period_id = ?', params[:academic_period_id]], 
                                 :page => params[:page]
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @lectures }
      format.json { render :json => @lectures }
    end
  end
  
  def new
    @lecture = Lecture.new
  end
  
  def create
    @lecture = Lecture.new(params[:lecture])
    @lecture.academic_period_id = params[:academic_period_id]
    @lecture.discipline = Discipline.find_by_code(params[:discipline_code])
    
    respond_to do |format|
      if @lecture.save
        format.html { redirect_to({:action => "index"}, :notice => 'Object was successfully created.') }
        format.xml  { render :xml => @lecture, :status => :created, :location => @lecture }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lecture.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  def show
    @lecture = Lecture.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @lecture }
      format.json { render :json => @lecture }
    end
  end
  
  def edit
    @lecture = Lecture.find(params[:id])
  end
  
  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
    
    respond_to do |format|
      format.html { redirect_to({:action => "index"}) }
      format.xml  { head :ok }
    end
  end
end
