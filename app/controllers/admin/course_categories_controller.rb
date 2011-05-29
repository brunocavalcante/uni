class Admin::CourseCategoriesController < ApplicationController
  def index
    @course_categories = CourseCategory.paginate :page => params[:page]
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @course_categories }
      format.json { render :json => @course_categories }
    end
  end

  def show
    @course_category = CourseCategory.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @course_category }
      format.json { render :json => @course_category }
    end
  end

  def new
    @course_category = CourseCategory.new
  end

  def edit
    @course_category = CourseCategory.find(params[:id])
  end

  def create
    @course_category = CourseCategory.new(params[:course_category])

    if @course_category.save
        redirect_to([:admin, @course_category], :notice => 'Course Category was successfully created.')
    else
        render :action => "new"
    end
  end

  def update
    @course_category = CourseCategory.find(params[:id])

    if @course_category.update_attributes(params[:course_category])
        redirect_to([:admin, @course_category], :notice => 'Course Category was successfully updated.')
    else
        render :action => "edit"
    end
  end

  def destroy
    @course_category = CourseCategory.find(params[:id])
    @course_category.destroy

    redirect_to :action => 'index'
  end
end
