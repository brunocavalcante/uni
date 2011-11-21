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
    @test.save
    
    respond_with @test, :location => {:action => :index}
  end
  
  def show
    @test = Test.find params[:id]
  end
  
  def edit
    @test = Test.find params[:id]
  end
  
  def update
    @test = Test.find params[:id]
    @test.update_attributes(params[:test])
    
    respond_with @test, :location => {:action => :index}
  end
  
  def destroy
    @test = Test.find(params[:id])
    @test.destroy

    respond_with @test, :location => {:action => :index}
  end
end
