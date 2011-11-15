require 'digest/md5'

class Admin::ProfessorsController < ApplicationController
  # GET /professors
  def index
    @professors = Professor.paginate :page => params[:page], :include => ['person'], :order => 'people.name'
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @professors.to_xml(:include => {:person => {:except => [:password]}}) }
      format.json { render :json => @professors }
    end
  end

  # GET /professors/1
  def show
    @professor = Professor.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @professor }
      format.json { render :json => @professor }
    end
  end

  # GET /professors/new
  def new
    @professor = Professor.new
    @professor.person = Person.new
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
    
    respond_to do |format|
      if @professor.save
        format.html { redirect_to([:admin, @professor], :notice => I18n.t('ProfessorCreated')) }
        format.xml  { render :xml => @professor, :status => :created, :location => @professor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @professor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /professors/1
  def update
    @professor = Professor.find(params[:id])

    if params[:reset_password]
      @professor.person.password = Digest::MD5.hexdigest(@professor.person.email)
    end

    if @professor.update_attributes(params[:professor])
      redirect_to([:admin, @professor], :notice => I18n.t('ProfessorUpdated'))
    else
      redirect_to :action => "edit"
    end
  end

  # DELETE /professors/1
  def destroy
    @professor = Professor.find(params[:id])
    @professor.destroy

    respond_to do |format|
      format.html { redirect_to(admin_professors_url, :notice => I18n.t('ProfessorDeleted')) }
      format.xml  { head :ok }
    end
  end
end
