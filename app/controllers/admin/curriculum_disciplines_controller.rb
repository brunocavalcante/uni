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
    params[:disciplines].each do |discipline_id|
      @curriculum_discipline = CurriculumDiscipline.new
      @curriculum_discipline.discipline_id = discipline_id
      @curriculum_discipline.curriculum_id = @curriculum.id
      @curriculum_discipline.module = params[:module]
      @curriculum.curriculum_disciplines << @curriculum_discipline
    end
    
    respond_to do |format|
      if @curriculum.save
        format.html { redirect_to({:action => "new"}, :notice => 'Course was successfully created.') }
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
        format.html { redirect_to([:admin, @course, @curriculum, @curriculum_discipline], :notice => 'Object was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @curriculum_discipline.errors, :status => :unprocessable_entity }
      end
    end
  end
end
