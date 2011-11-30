class Admin::CurriculumModulesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_curriculum
  
  def load_curriculum
    @course = Course.find params[:course_id]
    @curriculum = Curriculum.find params[:curriculum_id]
  end  
  
  def index
    @curriculum_modules = @curriculum.curriculum_modules.by_order.paginate :page => params[:page]
    
    respond_with @curriculum_modules
  end
  
  def new
    @curriculum_module = CurriculumModule.new
    
    respond_with @curriculum_module
  end
  
  def create
    @curriculum_module = CurriculumModule.new(params[:curriculum_module])
    @curriculum_module.curriculum = @curriculum
    @curriculum_module.save
    
    respond_with @curriculum_module, :location => [:admin, @course, @curriculum, @curriculum_module]
  end
  
  def show
    @curriculum_module = CurriculumModule.find(params[:id])
    
    respond_with @curriculum_module
  end
  
  def edit
    @curriculum_module = CurriculumModule.find(params[:id])
  end

  def update
    @curriculum_module = CurriculumModule.find(params[:id])
    @curriculum_module.update_attributes(params[:curriculum_module])

    respond_with @curriculum_module, :location => [:admin, @course, @curriculum, @curriculum_module]
  end

  def destroy
    @curriculum_module = CurriculumModule.find(params[:id])
    @curriculum_module.destroy

    respond_with @curriculum_module, :location => {:action => "index"}
  end
end
