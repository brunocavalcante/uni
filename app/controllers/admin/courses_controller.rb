class Admin::CoursesController < ApplicationController
  respond_to :html, :xml, :json
  
  # GET /courses
  # GET /courses.xml
  def index
    @courses = Course.with_category
    
    if params[:search] && params[:search] != ''
      @courses = @courses.where(['(code = ? OR name ILIKE ?)', params[:search], "%#{params[:search]}%"])
    end
    
    if params[:course_category_id] && params[:course_category_id] != ''
      @courses = @courses.where(:course_category_id => params[:course_category_id])
    end
    
    @courses = @courses.paginate :page => params[:page]
    
    respond_with @courses
  end

  # GET /courses/new
  # GET /courses/new.xml
  def new
    @course = Course.new

    respond_with @course
  end

  # POST /courses
  # POST /courses.xml
  def create
    @course = Course.new(params[:course])
    @course.save

    respond_with @course, :location => [:admin, @course]
  end
  
  # GET /courses/1
  # GET /courses/1.xml
  def show
    @course = Course.find(params[:id])

    respond_with @course
  end
  
  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # PUT /courses/1
  # PUT /courses/1.xml
  def update
    @course = Course.find(params[:id])
    @course.update_attributes(params[:course])

    respond_with @course, :location => [:admin, @course]
  end

  # DELETE /courses/1
  # DELETE /courses/1.xml
  def destroy
    @course = Course.find(params[:id])
    
    begin
      @course.destroy
    rescue
      @course.errors.add(:curriculums, :cant_delete_still_has_students)
    end

    respond_with @course, :location => admin_courses_url
  end
end
