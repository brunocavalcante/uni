class Admin::CursosController < ApplicationController
  # GET /cursos
  # GET /cursos.xml
  def index
    @cursos = Curso.all.paginate :page => params[:page]
  end

  # GET /cursos/1
  # GET /cursos/1.xml
  def show
    @curso = Curso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @curso }
    end
  end

  # GET /cursos/new
  # GET /cursos/new.xml
  def new
    @curso = Curso.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @curso }
    end
  end

  # GET /cursos/1/edit
  def edit
    @curso = Curso.find(params[:id])
  end

  # POST /cursos
  # POST /cursos.xml
  def create
    @curso = Curso.new(params[:curso])

    respond_to do |format|
      if @curso.save
        format.html { redirect_to([:admin, @curso], :notice => 'Curso was successfully created.') }
        format.xml  { render :xml => @curso, :status => :created, :location => @curso }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @curso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cursos/1
  # PUT /cursos/1.xml
  def update
    @curso = Curso.find(params[:id])

    respond_to do |format|
      if @curso.update_attributes(params[:curso])
        format.html { redirect_to([:admin, @curso], :notice => 'Curso was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @curso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.xml
  def destroy
    @curso = Curso.find(params[:id])
    @curso.destroy

    respond_to do |format|
      format.html { redirect_to(admin_cursos_url) }
      format.xml  { head :ok }
    end
  end
end
