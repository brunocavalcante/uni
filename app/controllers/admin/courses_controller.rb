class Admin::CoursesController < ApplicationController
  # GET /courses
  # GET /courses.xml
  def index
    @conditions = []
    if params[:search] || params[:course_category_id]
      if params[:search] != '' && params[:course_category_id] != ''
        @conditions = ['(code = ? OR name LIKE ?) AND course_category_id = ?', params[:search], "%#{params[:search]}%", params[:course_category_id]]
      elsif params[:search] != '' && params[:course_category_id] == ''
        @conditions = ['code = ? or name LIKE ?', params[:search], params[:search]]
      elsif params[:search] == '' && params[:course_category_id] != ''
        @conditions = ['course_category_id = ?', params[:course_category_id]]
      end
    end
    
    @courses = Course.paginate :conditions => @conditions, :page => params[:page]
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @courses.to_xml(:include => :course_category) }
      format.json { render :json => @courses.to_json(:include => :course_category) }
    end
  end

  # GET /courses/1
  # GET /courses/1.xml
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @course }
      format.json { render :json => @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.xml
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.xml
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to([:admin, @course], :notice => I18n.t('CourseCreated')) }
        format.xml  { render :xml => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.xml
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to([:admin, @course], :notice => I18n.t('CourseUpdated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.xml
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(admin_courses_url, :notice => I18n.t('CourseDeleted')) }
      format.xml  { head :ok }
    end
  end
end
