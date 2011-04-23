class Admin::DisciplinasController < ApplicationController
  before_filter :load_curso
  
  def load_curso
    @curso = Curso.find(params[:curso_id])
  end
  
  # GET /disciplinas
  # GET /disciplinas.xml
  def index
    @disciplinas = Disciplina.paginate :include => ['cursodisciplinas'], 
                                       :conditions => ['curso_disciplinas.curso_id = ?', params[:curso_id]], 
                                       :page => params[:page]
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @disciplinas }
      format.json { render :json => @disciplinas }
    end
  end

  # GET /disciplinas/1
  # GET /disciplinas/1.xml
  def show
    @disciplina = Disciplina.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @disciplina }
      format.json { render :json => @disciplina }
    end
  end

  # GET /disciplinas/new
  # GET /disciplinas/new.xml
  def new
    @disciplina = Disciplina.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @disciplina }
    end
  end

  # GET /disciplinas/1/edit
  def edit
    @disciplina = Disciplina.find(params[:id])
  end

  # POST /disciplinas
  # POST /disciplinas.xml
  def create
    @disciplina = Disciplina.new(params[:disciplina])
    @disciplina.cursos = [@curso]
    
    respond_to do |format|
      if @disciplina.save
        format.html { redirect_to([:admin, @curso, @disciplina], :notice => 'Disciplina was successfully created.') }
        format.xml  { render :xml => @disciplina, :status => :created, :location => @disciplina }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @disciplina.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /disciplinas/1
  # PUT /disciplinas/1.xml
  def update
    @disciplina = Disciplina.find(params[:id])

    if !@disciplina.curso_ids.include?(@curso.id)
      @disciplina.cursos << @curso
    end

    respond_to do |format|
      if @disciplina.update_attributes(params[:disciplina])
        format.html { redirect_to([:admin, @curso, @disciplina], :notice => 'Disciplina was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @disciplina.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplinas/1
  # DELETE /disciplinas/1.xml
  def destroy
    @disciplina = Disciplina.find(params[:id])
    
    if (@disciplina.cursos.size == 1)
      @disciplina.destroy
    else
      CursoDisciplina.delete_all ['curso_id = ? and disciplina_id = ?', @curso.id, @disciplina.id]
    end
    
    respond_to do |format|
      format.html { redirect_to(admin_curso_disciplinas_url(@curso)) }
      format.xml  { head :ok }
    end
  end
  
  # GET /disciplinas/search
  def search
    @disciplinas = Disciplina.paginate :include => ['cursodisciplinas'], 
                                       :conditions => ['curso_disciplinas.curso_id <> ?', params[:curso_id]], 
                                       :page => params[:page]
                                       
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @disciplinas }
      format.json { render :json => @disciplinas }
    end
  end
  
  def add
    @disciplina = Disciplina.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @disciplina }
      format.json { render :json => @disciplina }
    end
  end
end
