class Admin::CurriculumDisciplinesController < ApplicationController
  before_filter :init
  
  def init
    @course = Course.find(params[:course_id])
    @curriculum = Curriculum.find(params[:curriculum_id])
  end
  
  def new
    @curriculum_disciplines = @curriculum.disciplines
    @disciplines = Discipline.paginate :conditions => ['course_id = ? AND id NOT IN (?)', 
                                                       params[:course_id], 
                                                       @curriculum_disciplines.size > 0 ? @curriculum_disciplines.map(&:id) : 0], 
                                       :page => params[:page], 
                                       :order => 'name ASC, version ASC'
  end
  
  def create
    params[:curriculum_discipline][:discipline_ids].each do |discipline_id|
      @curriculum_discipline = CurriculumDiscipline.new
      @curriculum_discipline.discipline_id = discipline_id
      @curriculum_discipline.curriculum_id = @curriculum.id
      
      if params[:curriculum_discipline][:curriculum_module_id] != ''
        @curriculum_discipline.curriculum_module_id = params[:curriculum_discipline][:curriculum_module_id]
      end
      
      @curriculum.curriculum_disciplines << @curriculum_discipline
    end
    
    respond_to do |format|
      if @curriculum.save
        format.html { redirect_to([:admin, @course, @curriculum], :notice => I18n.t('CurriculumDisciplinesAdded')) }
        format.xml  { render :xml => @curriculum, :status => :created, :location => @curriculum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @curriculum.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @curriculum_discipline = CurriculumDiscipline.find(params[:id])
  end
  
  def edit
    @curriculum_discipline = CurriculumDiscipline.find(params[:id])
  end
  
  def update
    @curriculum_discipline = CurriculumDiscipline.find(params[:id])
    
    respond_to do |format|
      if @curriculum_discipline.update_attributes(params[:curriculum_discipline])
        format.html { redirect_to([:admin, @course, @curriculum, @curriculum_discipline], :notice => I18n.t('CurriculumDisciplineUpdated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @curriculum_discipline.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @curriculum_discipline = CurriculumDiscipline.find params[:id]
    @curriculum_discipline.destroy

    respond_to do |format|
      format.html { redirect_to([:admin, @course, @curriculum], :notice => I18n.t('CurriculumDisciplineDeleted')) }
      format.xml  { head :ok }
    end
  end
end
