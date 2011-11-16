class Professor::TestsController < ApplicationController
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find params[:lecture_id]
  end
  
  def index
    @tests = Test.paginate :conditions => ['lecture_id = ?', @lecture.id], 
                               :page => params[:page], 
                               :order => ['date ASC, name ASC']
  end
  
  def new
    @test = Test.new
  end
  
  def create
    @test = Test.new(params[:test])
    @test.lecture = @lecture

    respond_to do |format|
      if @test.save
        format.html { redirect_to({ :action => "index" }, :notice => I18n.t('TestCreated')) }
        format.xml  { render :xml => @test, :status => :created, :location => @test }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @test.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @test = Test.find params[:id]
  end
  
  def edit
    @test = Test.find params[:id]
  end
  
  def update
    @test = Test.find params[:id]
    
    respond_to do |format|
      if @test.update_attributes(params[:test])
        format.html { redirect_to({ :action => "show" }, :notice => I18n.t('TestUpdated')) }
        format.xml  { render :xml => @test, :status => :created, :location => @test }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @test.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @test = Test.find(params[:id])
    @test.destroy

    respond_to do |format|
      format.html { redirect_to({:action => "index"}, :notice => I18n.t('TestDeleted')) }
      format.xml  { head :ok }
    end
  end
end
