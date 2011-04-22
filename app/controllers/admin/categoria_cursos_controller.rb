class Admin::CategoriaCursosController < ApplicationController
  def index
    @categoriacursos = CategoriaCurso.paginate :page => params[:page]
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @categoriacursos }
      format.json { render :json => @categoriacursos }
    end
  end

  def show
    @categoriacurso = CategoriaCurso.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @categoriacurso }
      format.json { render :json => @categoriacurso }
    end
  end

  def new
    @categoriacurso = CategoriaCurso.new
  end

  def edit
    @categoriacurso = CategoriaCurso.find(params[:id])
  end

  def create
    @categoriacurso = CategoriaCurso.new(params[:categoria_curso])

    if @categoriacurso.save
        redirect_to([:admin, @categoriacurso], :notice => 'categoria de curso criada com sucesso.')
    else
        render :action => "new"
    end
  end

  def update
    @categoriacurso = CategoriaCurso.find(params[:id])

    if @categoriacurso.update_attributes(params[:categoriacurso])
        redirect_to([:admin, @categoriacurso], :notice => 'categoria de curso atualizada com sucesso.')
    else
        render :action => "edit"
    end
  end

  def destroy
    @categoriacurso = CategoriaCurso.find(params[:id])
    @categoriacurso.destroy

    redirect_to :action => 'index'
  end
end
