class Admin::PeriodosController < ApplicationController
  # GET /periodos
  def index
    @periodos = Periodo.paginate :page => params[:page]
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @periodos }
      format.json { render :json => @periodos }
    end
  end

  # GET /periodos/1
  def show
    @periodo = Periodo.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @periodo }
      format.json { render :json => @periodo }
    end
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
    
    respond_to do |format|
      if @periodo.save
        format.html { redirect_to([:admin, @periodo], :notice => 'Periodo was successfully created.') }
        format.xml  { render :xml => @periodo, :status => :created, :location => @periodo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @periodo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /periodos/1
  def update
    @periodo = Periodo.find(params[:id])

    respond_to do |format|
      if @periodo.update_attributes(params[:periodo])
        format.html { redirect_to([:admin, @periodo], :notice => 'Periodo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @periodo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /periodos/1
  def destroy
    @periodo = Periodo.find(params[:id])
    @periodo.destroy

    redirect_to(admin_periodos_url)
  end
end
