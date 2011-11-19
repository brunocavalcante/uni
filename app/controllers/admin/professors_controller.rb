require 'digest/md5'

class Admin::ProfessorsController < ApplicationController
  respond_to :html, :xml, :json
  
  # GET /professors
  def index
    @professors = Professor.by_person.with_scholarity.paginate :page => params[:page]
    
    respond_with @professors
  end

  # GET /professors/1
  def show
    @professor = Professor.find(params[:id])
    
    respond_with @professor
  end

  # GET /professors/new
  def new
    @professor = Professor.new
    @professor.person = Person.new
    
    respond_with @professor
  end

  # GET /professors/1/edit
  def edit
    @professor = Professor.find(params[:id])
  end

  # POST /professors
  def create
    @professor = Professor.new(params[:professor])
    @professor.person.password = Digest::MD5.hexdigest(@professor.person.email)
    @professor.person.roles = [Role.find_by_name('Professor')]
    
    flash[:notice] = I18n.t('ProfessorCreated') if @professor.save
    
    respond_with @professor, :location => [:admin, @professor]
  end

  # PUT /professors/1
  def update
    @professor = Professor.find(params[:id])
    @professor.person.password = Digest::MD5.hexdigest(@professor.person.email) if params[:reset_password]

    flash[:notice] = I18n.t('ProfessorUpdated') if @professor.update_attributes(params[:professor])
    
    respond_with @professor, :location => [:admin, @professor]
  end

  # DELETE /professors/1
  def destroy
    @professor = Professor.find(params[:id])
    
    flash[:notice] = I18n.t('ProfessorDeleted') if @professor.destroy

    respond_with @professor, :location => admin_professors_url
  end
end
