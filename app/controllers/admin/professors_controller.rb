require 'digest/md5'

class Admin::ProfessorsController < ApplicationController
  respond_to :html, :xml, :json
  
  # GET /professors
  def index
    @professors = Professor.by_person.with_scholarity
    @professors = @professors.where_name(params[:term]) if params[:term]
    if params[:scholarity_id] && params[:scholarity_id] != ''
      @professors = @professors.where('people.scholarity_id = ?', params[:scholarity_id])
    end
    @professors = @professors.where_active(params[:active] == '1') if params[:active] && params[:active] != ''
    @professors = @professors.paginate :page => params[:page]
    
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
    @professor.save
    
    respond_with @professor, :location => [:admin, @professor]
  end

  # PUT /professors/1
  def update
    @professor = Professor.find(params[:id])
    @professor.person.password = Digest::MD5.hexdigest(@professor.person.email) if params[:reset_password]
    @professor.update_attributes(params[:professor])
    
    respond_with @professor, :location => [:admin, @professor]
  end

  # DELETE /professors/1
  def destroy
    @professor = Professor.find(params[:id])
    
    begin
      @professor.destroy
    rescue ActiveRecord::DeleteRestrictionError
      @professor.errors.add(:lecture_professors, :cant_destroy_still_has_lectures)
      flash[:alert] = I18n.t('activerecord.errors.models.professor.attributes.lecture_professors.cant_destroy_still_has_lectures')
    rescue
      @professor.errors.add(:lecture_professors)
    end

    respond_with @professor, :location => admin_professors_url
  end
end
