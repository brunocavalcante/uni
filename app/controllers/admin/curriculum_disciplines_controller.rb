class Admin::CurriculumDisciplinesController < ApplicationController
  respond_to :html, :xml, :json
  
  before_filter :init
  
  def init
    @course = Course.find(params[:course_id])
    @curriculum = Curriculum.find(params[:curriculum_id])
  end
  
  def new
    @curriculum_discipline = CurriculumDiscipline.new
    
    respond_with @curriculum_discipline
  end
  
  def create
    params[:curriculum_disciplines][:discipline_ids].each do |discipline_id|
      @curriculum_discipline = CurriculumDiscipline.new
      @curriculum_discipline.discipline_id = discipline_id
      @curriculum_discipline.curriculum_id = @curriculum.id
      @curriculum_discipline.mandatory = (params[:mandatory] == '1')
      
      if params[:curriculum_disciplines][:curriculum_module_id] != ''
        @curriculum_discipline.curriculum_module_id = params[:curriculum_disciplines][:curriculum_module_id]
      end
      
      @curriculum.curriculum_disciplines << @curriculum_discipline
    end
    
    flash[:notice] = I18n.t('flash.admin.curriculum_disciplines.create.notice', :resource_name => I18n.t('Disciplines')) if @curriculum.save
    
    respond_with @curriculum, :location => [:admin, @course, @curriculum]
  end
  
  def show
    @curriculum_discipline = CurriculumDiscipline.find(params[:id])
    
    respond_with @curriculum_discipline
  end
  
  def edit
    @curriculum_discipline = CurriculumDiscipline.find(params[:id])
  end
  
  def update
    @curriculum_discipline = CurriculumDiscipline.find(params[:id])
    @curriculum_discipline.update_attributes(params[:curriculum_discipline])
    @curriculum_discipline.prerequisite_ids = nil unless params[:curriculum_discipline][:prerequisite_ids]
    
    respond_with @curriculum_discipline, :location => [:admin, @course, @curriculum]
  end
  
  def destroy
    @curriculum_discipline = CurriculumDiscipline.find params[:id]
    @curriculum_discipline.destroy

    respond_with @curriculum_discipline, :location => [:admin, @course, @curriculum]
  end
end
