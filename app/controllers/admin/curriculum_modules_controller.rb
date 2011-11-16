class Admin::CurriculumModulesController < ApplicationController
  before_filter :load_curriculum
  
  def load_curriculum
    @course = Course.find params[:course_id]
    @curriculum = Curriculum.find params[:curriculum_id]
  end  
  
  def index
    @curriculum_modules = CurriculumModule.paginate :conditions => {:curriculum_id => params[:curriculum_id]}, 
                                                    :page => params[:page]
  end
  
  def new
    @curriculum_module = CurriculumModule.new
  end
  
  def create
    @curriculum_module = CurriculumModule.new(params[:curriculum_module])
    @curriculum_module.curriculum = @curriculum

    respond_to do |format|
      if @curriculum_module.save
        format.html { redirect_to([:admin, @course, @curriculum, @curriculum_module], :notice => I18n.t('CurriculumModuleCreated')) }
        format.xml  { render :xml => @curriculum_module, :status => :created, :location => @curriculum_module }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @curriculum_module.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @curriculum_module = CurriculumModule.find(params[:id])
  end
  
  def edit
    @curriculum_module = CurriculumModule.find(params[:id])
  end

  def update
    @curriculum_module = CurriculumModule.find(params[:id])

    respond_to do |format|
      if @curriculum_module.update_attributes(params[:course])
        format.html { redirect_to({:action => "show"}, :notice => I18n.t('CurriculumModuleUpdated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @curriculum_module.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @curriculum_module = CurriculumModule.find(params[:id])
    @curriculum_module.destroy

    respond_to do |format|
      format.html { redirect_to({:action => "index"}, :notice => I18n.t('CurriculumModuleDeleted')) }
      format.xml  { head :ok }
    end
  end
end
