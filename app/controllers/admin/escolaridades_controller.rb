class Admin::EscolaridadesController < ApplicationController
  def index
    @escolaridades = Escolaridade.paginate :page => params[:page]
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @escolaridades }
      format.json { render :json => @escolaridades }
    end
  end

  def show
    @escolaridade = Escolaridade.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @escolaridade }
      format.json { render :json => @escolaridade }
    end
  end

  def new
    @escolaridade = Escolaridade.new
  end

  def edit
    @escolaridade = Escolaridade.find(params[:id])
  end

  def create
    @escolaridade = Escolaridade.new(params[:escolaridade])

    if @escolaridade.save
        redirect_to([:admin, @escolaridade], :notice => 'Escolaridade was successfully created.')
    else
        render :action => "new"
    end
  end

  def update
    @escolaridade = Escolaridade.find(params[:id])

    if @escolaridade.update_attributes(params[:escolaridade])
        redirect_to([:admin, @escolaridade], :notice => 'Escolaridade was successfully updated.')
    else
        render :action => "edit"
    end
  end

  def destroy
    @escolaridade = Escolaridade.find(params[:id])
    @escolaridade.destroy

    redirect_to :action => 'index'
  end
end
