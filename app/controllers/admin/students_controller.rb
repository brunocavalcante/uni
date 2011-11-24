class Admin::StudentsController < ApplicationController
  respond_to :html, :xml, :json
  
  # GET /students
  def index
    @students = Student.by_name
    @students = @students.where_code_or_name(params[:term]) if params[:term]
    @students = @students.paginate :page => params[:page]
    
    @students_hash = []
    @students.each do |student|
      @students_hash << {"id" => student.id, "label" => student.code + ' - ' + student.name}
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
    @student = Student.find params[:id]
    
    respond_with @student
  end

  # GET /students/new
  def new
    @student = Student.new
    @student.person = Person.new
    
    respond_with @student
  end

  # GET /students/1/edit
  def edit
    @student = Student.find params[:id]
  end

  # POST /students
  def create
    @student = Student.new(params[:student])
    @student.person.password = Digest::MD5.hexdigest(@student.code)
    @student.person.roles = [Role.find_by_name('Student')]
    @student.save
    
    respond_with @student, :location => [:admin, @student]
  end

  # PUT /students/1
  def update
    @student = Student.find params[:id]
    @student.person.photo = nil if params[:delete_photo]
    @student.person.password = Digest::MD5.hexdigest(@student.code) if params[:reset_password]
    @student.update_attributes(params[:student])
    
    respond_with @student, :location => [:admin, @student]
  end

  # DELETE /students/1
  def destroy
    @student = Student.find params[:id]
    @student.destroy

    respond_with @student, :location => admin_students_url
  end
end
