class Admin::AlunosController < ApplicationController
  # GET /alunos
  def index
    @alunos = Aluno.all.paginate :page => params[:page], :per_page => 20
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @alunos }
      format.json { render :json => @alunos }
    end
  end

  # GET /alunos/1
  def show
    @aluno = Aluno.find_by_matricula(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @aluno }
      format.json { render :json => @aluno }
    end
  end

  # GET /alunos/new
  def new
    @aluno = Aluno.new
    @aluno.pessoa = Pessoa.new
  end

  # GET /alunos/1/edit
  def edit
    @aluno = Aluno.find_by_matricula(params[:id])
  end

  # POST /alunos
  def create
    @aluno = Aluno.new(params[:aluno])
    
    if @aluno.save
      redirect_to([:admin, @aluno], :notice => 'Aluno was successfully created.')
    else
      redirect_to :action => "new"
    end
  end

  # PUT /alunos/1
  def update
    @aluno = Aluno.find_by_matricula(params[:id])

    if @aluno.update_attributes(params[:aluno])
      redirect_to([:admin, @aluno], :notice => 'Aluno was successfully updated.')
    else
      redirect_to :action => "edit"
    end
  end

  # DELETE /alunos/1
  def destroy
    @aluno = Aluno.find_by_matricula(params[:id])
    @aluno.destroy

    redirect_to(admin_alunos_url)
  end
end
