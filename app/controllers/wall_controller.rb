class WallController < ApplicationController
  before_filter :load_lecture
    
  def load_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
  
  def index
    load_walls
    
    @wall = Wall.new
    @wall.message = Message.new
  end
  
  def load_walls
    @walls = Wall.paginate :conditions => ['lecture_id = ?', params[:lecture_id]], 
                          :include => [{:message => :person}], 
                          :page => params[:page], 
                          :order => 'created_at DESC'
  end
  
  def create
    @wall = Wall.new(params[:wall])
    @wall.message.person = @user
    @wall.lecture_id = params[:lecture_id]
    
    respond_to do |format|
      if @wall.save
        format.html { redirect_to({:action => "index"}, :notice => I18n.t('WallCreated')) }
        format.xml  { render :xml => @wall, :status => :created, :location => @wall }
      else
        format.html {
          load_walls
          render :action => "index"
        }
        format.xml  { render :xml => @wall.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @wall = Wall.find(params[:id])
    @wall.destroy

    respond_to do |format|
      format.html { redirect_to({:action => "index", :notice => I18n.t('WallDeleted')}) }
      format.xml  { head :ok }
    end
  end
end
