class Admin::AlunosCursoController < ApplicationController
  def index
    @alunos = Aluno.paginate :page => params[:page], 
                             :include => ['cursos'], 
                             :conditions => ['aluno_cursos.curso_id = ?', params[:curso_id]]
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