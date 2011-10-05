class Admin::StudentsController < ApplicationController
  # GET /students
  def index
    @students = Student.paginate :conditions => ['people.name ILIKE ? OR code = ?', 
                                                 '%' + params[:term] + '%', params[:term]], 
                                 :page => params[:page], 
                                 :include => ['person'], 
                                 :order => 'people.name'
    
    @students_hash = []
    @students.each do |student|
      @students_hash << {"id" => student.code, "label" => student.code + ' - ' + student.name}
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @students }
      format.json { render :json => @students.to_json(:include => [:person]) }
      format.js { render :json => @students_hash }
    end
  end

  # GET /students/1
  def show
    @student = Student.find_by_code(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @student }
      format.json { render :json => @student }
    end
  end

  # GET /students/new
  def new
    @student = Student.new
    @student.person = Person.new
  end

  # GET /students/1/edit
  def edit
    @student = Student.find_by_code(params[:id])
  end

  # POST /students
  def create
    @student = Student.new(params[:student])
    @student.person.password = Digest::MD5.hexdigest(@student.c)
    @student.person.roles = [Role.find_by_name('Student')]
    
    if @student.save
      redirect_to([:admin, @student], :notice => 'Student was successfully created.')
    else
      redirect_to :action => "new"
    end
  end

  # PUT /students/1
  def update
    @student = Student.find_by_code(params[:id])
    
    if params[:delete_photo]
      params[:photo] = nil
      @student.person.photo = nil
    end

    if @student.update_attributes(params[:student])
      redirect_to([:admin, @student], :notice => 'Student was successfully updated.')
    else
      redirect_to :action => "edit"
    end
  end

  # DELETE /students/1
  def destroy
    @student = Student.find_by_code(params[:id])
    @student.destroy

    redirect_to(admin_students_url)
  end
end
