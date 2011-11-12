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
end
