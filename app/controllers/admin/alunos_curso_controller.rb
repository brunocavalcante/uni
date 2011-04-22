class Admin::AlunosCursoController < ApplicationController
  def index
    @alunos = Aluno.all(:include => ['cursos'], 
                        :conditions => ['aluno_cursos.curso_id = ?', params[:curso_id]]).paginate :page => params[:page], :per_page => 20
    @curso = Curso.find(params[:curso_id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @alunos }
      format.json { render :json => @alunos }
    end
  end
  
  def show
    
  end
end