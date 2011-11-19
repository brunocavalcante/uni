class Admin::ScholaritiesController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @scholarities = Scholarity.paginate :page => params[:page]
    
    respond_with @scholarities
  end

  def show
    @scholarity = Scholarity.find(params[:id])
    
    respond_with @scholarity
  end

  def new
    @scholarity = Scholarity.new
    
    respond_with @scholarity
  end

  def edit
    @scholarity = Scholarity.find(params[:id])
  end

  def create
    @scholarity = Scholarity.new(params[:scholarity])

    flash[:notice] = I18n.t('ScholarityCreated') if @scholarity.save

    respond_with @scholarity, :location => [:admin, @scholarity]
  end

  def update
    @scholarity = Scholarity.find(params[:id])

    flash[:notice] = I18n.t('ScholarityUpdated') if @scholarity.update_attributes(params[:scholarity])
    
    respond_with @scholarity, :location => [:admin, @scholarity]
  end

  def destroy
    @scholarity = Scholarity.find(params[:id])
    
    flash[:notice] = I18n.t('ScholarityDeleted') if @scholarity.destroy

    respond_with @scholarity, :location => {:action => :index}
  end
end
