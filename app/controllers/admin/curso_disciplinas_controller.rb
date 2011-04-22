class Admin::CursoDisciplinasController < ApplicationController
  def index
    @disciplinas = Disciplina.paginate :page => params[:page], 
                                       :include => ['cursodisciplinas'], 
                                       :conditions => ['curso_disciplinas.curso_id = ?', params[:curso_id]]
    @curso = Curso.find(params[:curso_id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @disciplinas}
      format.json { render :json => @disciplinas }
    end
  end
  
  def show
    
  end
end