class Admin::TransferredDisciplinesController < ApplicationController
  before_filter :load_curriculum_student
  
  def load_curriculum_student
    @curriculum_student = CurriculumStudent.find params[:curriculum_student_id]
    @curriculum = @curriculum_student.curriculum
    @course = @curriculum.course
  end
  
  def index
    @transferred_disciplines = TransferredDiscipline.paginate :conditions => ['curriculum_student_id = ?', 
                                                                              @curriculum_student.id], 
                                                              :include => [:discipline], 
                                                              :page => params[:page]
  end
  
  def new
    @transferred_discipline = TransferredDiscipline.new
  end
  
  def create
    @transferred_discipline = TransferredDiscipline.new(params[:transferred_discipline])
    @transferred_discipline.curriculum_student_id = @curriculum_student.id

    respond_to do |format|
      if @transferred_discipline.save
        format.html { redirect_to({:action => "index"}, :notice => I18n.t('TransferredDisciplineCreated')) }
        format.xml  { render :xml => @transferred_discipline, :status => :created, :location => @transferred_discipline }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transferred_discipline.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @transferred_discipline = TransferredDiscipline.find params[:id]
  end
  
  def edit
    @transferred_discipline = TransferredDiscipline.find params[:id]
  end
  
  def update
    @transferred_discipline = TransferredDiscipline.find params[:id]

    respond_to do |format|
      if @transferred_discipline.update_attributes(params[:transferred_discipline])
        format.html { redirect_to({:action => "show"}, :notice => I18n.t('TransferredDisciplineUpdated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transferred_discipline.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @transferred_discipline = TransferredDiscipline.find params[:id]
    @transferred_discipline.destroy

    respond_to do |format|
      format.html { redirect_to(admin_course_curriculum_student_transferred_disciplines_path(@course, @curriculum_student), :notice => I18n.t('TransferredDisciplineDeleted')) }
      format.xml  { head :ok }
    end
  end
end
