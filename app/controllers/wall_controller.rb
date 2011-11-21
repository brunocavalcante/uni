class WallController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_lecture
    
  def load_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
  
  def index
    load_walls
    
    @wall = Wall.new
    @wall.message = Message.new
    
    respond_with @walls
  end
  
  def load_walls
    @walls = @lecture.walls.with_message.by_date.paginate :page => params[:page]
  end
  
  def create
    load_walls
    
    @wall = Wall.new(params[:wall])
    @wall.message.person = @user
    @wall.lecture_id = params[:lecture_id]
    @wall.save
    
    respond_with @wall, :location => {:action => "index"}
  end
  
  def destroy
    @wall = Wall.find(params[:id])
    @wall.destroy
    
    respond_with @wall, :location => {:action => "index"}
  end
end
