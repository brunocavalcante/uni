class Admin::CadeirasController < ApplicationController
  # GET /cadeiras
  # GET /cadeiras.xml
  def index
    @cadeiras = Cadeira.all(:conditions => ['curso_id = ?', params[:curso_id]])
    @curso = Curso.find(params[:curso_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cadeiras }
    end
  end

  # GET /cadeiras/1
  # GET /cadeiras/1.xml
  def show
    @cadeira = Cadeira.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cadeira }
    end
  end

  # GET /cadeiras/new
  # GET /cadeiras/new.xml
  def new
    @cadeira = Cadeira.new
    @curso = Curso.find(params[:curso_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cadeira }
    end
  end

  # GET /cadeiras/1/edit
  def edit
    @cadeira = Cadeira.find(params[:id])
    @curso = Curso.find(params[:id])
  end

  # POST /cadeiras
  # POST /cadeiras.xml
  def create
    @cadeira = Cadeira.new(params[:cadeira])
    @cadeira.curso_id = params[:curso_id]

    respond_to do |format|
      if @cadeira.save
        format.html { redirect_to([:admin, @cadeira.curso, @cadeira], :notice => 'Cadeira was successfully created.') }
        format.xml  { render :xml => @cadeira, :status => :created, :location => @cadeira }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cadeira.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cadeiras/1
  # PUT /cadeiras/1.xml
  def update
    @cadeira = Cadeira.find(params[:id])

    respond_to do |format|
      if @cadeira.update_attributes(params[:cadeira])
        format.html { redirect_to([:admin, @cadeira.curso, @cadeira], :notice => 'Cadeira was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cadeira.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cadeiras/1
  # DELETE /cadeiras/1.xml
  def destroy
    @cadeira = Cadeira.find(params[:id])
    @cadeira.destroy

    respond_to do |format|
      format.html { redirect_to(admin_cadeiras_url) }
      format.xml  { head :ok }
    end
  end
end
