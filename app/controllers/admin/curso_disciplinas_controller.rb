class Admin::CursoDisciplinasController < ApplicationController
  def index
    @disciplinas = Disciplina.all(:include => ['cursodisciplinas'], 
                                  :conditions => ['curso_disciplinas.curso_id = ?', params[:curso_id]]).paginate :page => params[:page], :per_page => 20
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