class Admin::LecturesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_academic_period
  
  def load_academic_period
    @academic_period = AcademicPeriod.find(params[:academic_period_id])
  end
  
  def index
    @lectures = @academic_period.lectures.includes.with_discipline.by_code
    @lectures = @lectures.where_code_or_name(params[:term]) if params[:term]
    if params[:course_id] && params[:course_id] != ''
      @lectures = @lectures.where('disciplines.course_id = ?', params[:course_id]) if params[:course_id] && params[:course_id] != ''
    end
    @lectures = @lectures.pending if params[:situation] && params[:situation] == 'pending'
    @lectures = @lectures.paginate :page => params[:page]
    
    respond_with @lectures
  end
  
  def new
    @lecture = Lecture.new
    
    respond_with @lecture
  end
  
  def create
    @lecture = Lecture.new(params[:lecture])
    @lecture.academic_period_id = params[:academic_period_id]
    @lecture.lecture_time_slots = timeslots_from_params
    @lecture.save
    
    respond_with @lecture, :location => [:admin, @academic_period, @lecture]
  end
  
  def timeslots_from_params
    @time_slots = []
    for i in 0..params[:weekday].size - 1
      if params[:weekday][i] && params[:start_time][i] != '' && params[:end_time][i] != ''
        @time_slot = LectureTimeSlot.new
        @time_slot.weekday = params[:weekday][i]
        @time_slot.start_time = params[:start_time][i].delete ":"
        @time_slot.end_time = params[:end_time][i].delete ":"
        @time_slots << @time_slot
      end
    end
    
    return @time_slots
  end
  
  def show
    @lecture = Lecture.find(params[:id])
    @lecture_students = @lecture.lecture_students.by_name.paginate :page => params[:page]
    
    respond_with @lecture
  end
  
  def edit
    @lecture = Lecture.find(params[:id])
  end
  
  def update
    @lecture = Lecture.find(params[:id])
    @lecture.attributes = params[:lecture]
    @lecture.lecture_time_slots = timeslots_from_params
    @lecture.save
    
    respond_with @lecture, :location => [:admin, @academic_period, @lecture]
  end
  
  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
    
    respond_with @lecture, :location => {:action => :index}
  end
end
