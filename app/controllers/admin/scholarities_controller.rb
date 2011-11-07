class Admin::ScholaritiesController < ApplicationController
  def index
    @scholarities = Scholarity.paginate :page => params[:page]
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @scholarities }
      format.json { render :json => @scholarities }
    end
  end

  def show
    @scholarity = Scholarity.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @scholarity }
      format.json { render :json => @scholarity }
    end
  end

  def new
    @scholarity = Scholarity.new
  end

  def edit
    @scholarity = Scholarity.find(params[:id])
  end

  def create
    @scholarity = Scholarity.new(params[:scholarity])

    if @scholarity.save
        redirect_to([:admin, @scholarity], :notice => I18n.t('ScholarityCreated'))
    else
        render :action => "new"
    end
  end

  def update
    @scholarity = Scholarity.find(params[:id])

    if @scholarity.update_attributes(params[:scholarity])
        redirect_to([:admin, @scholarity], :notice => I18n.t('ScholarityUpdated'))
    else
        render :action => "edit"
    end
  end

  def destroy
    @scholarity = Scholarity.find(params[:id])
    @scholarity.destroy

    respond_to do |format|
      format.html { redirect_to({:action => 'index'}, :notice => I18n.t('ScholarityDeleted')) }
      format.xml  { head :ok }
    end
  end
end
