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
    @escolaridade = Scholarity.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @escolaridade }
      format.json { render :json => @escolaridade }
    end
  end

  def new
    @escolaridade = Scholarity.new
  end

  def edit
    @escolaridade = Scholarity.find(params[:id])
  end

  def create
    @escolaridade = Scholarity.new(params[:escolaridade])

    if @escolaridade.save
        redirect_to([:admin, @escolaridade], :notice => 'Scholarity was successfully created.')
    else
        render :action => "new"
    end
  end

  def update
    @escolaridade = Scholarity.find(params[:id])

    if @escolaridade.update_attributes(params[:escolaridade])
        redirect_to([:admin, @escolaridade], :notice => 'Scholarity was successfully updated.')
    else
        render :action => "edit"
    end
  end

  def destroy
    @escolaridade = Scholarity.find(params[:id])
    @escolaridade.destroy

    redirect_to :action => 'index'
  end
end
