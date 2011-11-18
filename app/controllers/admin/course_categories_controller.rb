class Admin::CourseCategoriesController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @course_categories = CourseCategory.paginate :page => params[:page]
    
    respond_with @course_categories
  end

  def show
    @course_category = CourseCategory.find(params[:id])
    
    respond_with @course_category
  end

  def new
    @course_category = CourseCategory.new
    
    respond_with @course_category
  end

  def edit
    @course_category = CourseCategory.find(params[:id])
  end

  def create
    @course_category = CourseCategory.new(params[:course_category])

    flash[:notice] = I18n.t('CourseCategoryCreated') if @course_category.save
    
    respond_with @course_category, :location => [:admin, @course_category]
  end

  def update
    @course_category = CourseCategory.find(params[:id])

    flash[:notice] = I18n.t('CourseCategoryUpdated') if @course_category.update_attributes(params[:course_category])

    respond_with @course_category, :location => [:admin, @course_category]
  end

  def destroy
    @course_category = CourseCategory.find(params[:id])
    
    flash[:notice] = I18n.t('CourseCategoryDeleted') if @course_category.destroy

    respond_with @course_category, :location => {:action => 'index'}
  end
end
