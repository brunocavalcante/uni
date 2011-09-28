class Admin::CurriculumDisciplinesController < ApplicationController
  before_filter :init
  
  def init
    @course = Course.find(params[:course_id])
    @curriculum = Curriculum.find(params[:curriculum_id])
  end
  
  def new
    @disciplines = Discipline.paginate :conditions => ['course_id = ? AND id NOT IN (?)', 
                                                       params[:course_id], 
                                                       @curriculum.disciplines.map(&:id)], 
                                       :page => params[:page], 
                                       :order => 'name ASC, version ASC'
  end
  
  def create
    @curriculum.discipline_ids = params[:disciplines]
    
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
    @course = Course.find(params[:course_id])
    @curriculum = Curriculum.find(params[:curriculum_id])
    @curriculum_discipline = CurriculumDiscipline.find(params[:id])
  end
end
