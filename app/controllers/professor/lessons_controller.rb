class Professor::LessonsController < ApplicationController
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find params[:lecture_id]
  end
  
  def index
    @lessons = Lesson.paginate :conditions => ['lecture_id = ?', @lecture.id], 
                               :page => params[:page], 
                               :order => ['date DESC']
  end
  
  def new
    @lesson = Lesson.new
  end
  
  def create
    @lesson = Lesson.new(params[:lesson])
    @lesson.lecture = @lecture

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to({ :action => "index" }, :notice => 'Object was successfully created.') }
        format.xml  { render :xml => @lesson, :status => :created, :location => @lesson }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lesson.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @lesson = Lesson.find params[:id]
  end
  
  def edit
    @lesson = Lesson.find params[:id]
  end
  
  def update
    @lesson = Lesson.find params[:id]
    
    respond_to do |format|
      if @lesson.update_attributes(params[:lesson])
        format.html { redirect_to({ :action => "show" }, :notice => 'Object was successfully created.') }
        format.xml  { render :xml => @lesson, :status => :created, :location => @lesson }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lesson.errors, :status => :unprocessable_entity }
      end
    end
  end
end
