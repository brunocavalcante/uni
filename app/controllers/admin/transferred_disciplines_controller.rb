class Admin::TransferredDisciplinesController < ApplicationController
  respond_to :html, :xml, :json
  
  before_filter :load_curriculum_student
  
  def load_curriculum_student
    @curriculum_student = CurriculumStudent.find params[:curriculum_student_id]
    @curriculum = @curriculum_student.curriculum
    @course = @curriculum.course
  end
  
  def index
    @transferred_disciplines = @curriculum_student.transferred_disciplines.by_name.paginate :page => params[:page]
    
    respond_with @transferred_disciplines
  end
  
  def new
    @transferred_discipline = TransferredDiscipline.new
    
    respond_with @transferred_discipline
  end
  
  def create
    @transferred_discipline = TransferredDiscipline.new(params[:transferred_discipline])
    @transferred_discipline.curriculum_student_id = @curriculum_student.id

    flash[:notice] = I18n.t('TransferredDisciplineCreated') if @transferred_discipline.save

    respond_with @transferred_disciplines, :location => {:action => :index}
  end
  
  def show
    @transferred_discipline = TransferredDiscipline.find params[:id]
    
    respond_with @transferred_discipline
  end
  
  def edit
    @transferred_discipline = TransferredDiscipline.find params[:id]
  end
  
  def update
    @transferred_discipline = TransferredDiscipline.find params[:id]

    flash[:notice] = I18n.t('TransferredDisciplineUpdated') if @transferred_discipline.update_attributes(params[:transferred_discipline])

    respond_with @transferred_disciplines, :location => {:action => :show}
  end

  def destroy
    @transferred_discipline = TransferredDiscipline.find params[:id]
    
    flash[:notice] = I18n.t('TransferredDisciplineDeleted') if @transferred_discipline.destroy

    respond_with @transferred_discipline, :location => {:action => :index}
  end
end
