class Professor::LessonsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find params[:lecture_id]
  end
  
  def index
    @lessons = @lecture.lessons.paginate :page => params[:page]
    
    respond_with @lessons
  end
  
  def new
    @lesson = Lesson.new
    
    respond_with @lesson
  end
  
  def create
    @lesson = Lesson.new(params[:lesson])
    @lesson.lecture = @lecture

    flash[:notice] = I18n.t('LessonCreated') if @lesson.save

    respond_with @lesson, :location => {:action => :index}
  end
  
  def show
    @lesson = Lesson.find params[:id]
  end
  
  def edit
    @lesson = Lesson.find params[:id]
  end
  
  def update
    @lesson = Lesson.find params[:id]
    
    flash[:notice] = I18n.t('LessonUpdated') if @lesson.update_attributes(params[:lesson])
    
    respond_with @lesson, :location => {:action => :show}
  end
  
  def destroy
    @lesson = Lesson.find(params[:id])
    
    flash[:notice] = I18n.t('LessonDeleted') if @lesson.destroy

    respond_with @lesson, :location => {:action => :index}
  end
end
