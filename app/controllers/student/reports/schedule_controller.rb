class Student::Reports::ScheduleController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_student
  
  def load_student
    @student = Student.find_by_person_id @user.id
  end
  
  def index
    @lectures = @student.lectures.current
    @schedule = @student.schedule
    
    respond_with @schedule
  end
end
