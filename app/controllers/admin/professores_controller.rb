class Admin::ProfessoresController < ApplicationController
  # GET /professores
  def index
    @professores = Professor.paginate :page => params[:page]
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @professores }
      format.json { render :json => @professores }
    end
  end

  # GET /professores/1
  def show
    @professor = Professor.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @professor }
      format.json { render :json => @professor }
    end
  end

  # GET /professores/new
  def new
    @professor = Professor.new
    @professor.pessoa = Pessoa.new
  end

  # GET /professores/1/edit
  def edit
    @professor = Professor.find(params[:id])
  end

  # POST /professores
  def create
    @professor = Professor.new(params[:professor])
    
    if @professor.save
      redirect_to([:admin, @professor], :notice => 'Professor was successfully created.')
    else
      redirect_to :action => "new"
    end
  end

  # PUT /professores/1
  def update
    @professor = Professor.find(params[:id])

    if @professor.update_attributes(params[:professor])
      redirect_to([:admin, @professor], :notice => 'Professor was successfully updated.')
    else
      redirect_to :action => "edit"
    end
  end

  # DELETE /professores/1
  def destroy
    @professor = Professor.find(params[:id])
    @professor.destroy

    redirect_to(admin_professores_url)
  end
end
