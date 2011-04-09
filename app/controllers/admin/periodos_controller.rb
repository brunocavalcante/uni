class Admin::PeriodosController < ApplicationController
  # GET /periodos
  def index
    @periodos = Periodo.all.paginate :page => params[:page], :per_page => 20
  end

  # GET /periodos/1
  def show
    @periodo = Periodo.find(params[:id])
  end

  # GET /periodos/new
  def new
    @periodo = Periodo.new
  end

  # GET /periodos/1/edit
  def edit
    @periodo = Periodo.find(params[:id])
  end

  # POST /periodos
  def create
    @periodo = Periodo.new(params[:periodo])
    
    if @periodo.save
      redirect_to([:admin, @periodo], :notice => 'Periodo was successfully created.')
    else
      redirect_to :action => "new"
    end
  end

  # PUT /periodos/1
  def update
    @periodo = Periodo.find(params[:id])

    if @periodo.update_attributes(params[:periodo])
      redirect_to([:admin, @periodo], :notice => 'Periodo was successfully updated.')
    else
      redirect_to :action => "edit"
    end
  end

  # DELETE /periodos/1
  def destroy
    @periodo = Periodo.find(params[:id])
    @periodo.destroy

    redirect_to(admin_periodos_url)
  end
end
