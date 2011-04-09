class Admin::AlunosCursoController < ApplicationController
  def index
    @alunos = Aluno.all(:conditions => ['curso_id = ?', params[:curso_id]])
    @curso = Curso.find(params[:curso_id])
  end
  
  def show
    
  end
end