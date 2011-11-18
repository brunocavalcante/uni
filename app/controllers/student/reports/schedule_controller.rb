class Student::Reports::ScheduleController < ApplicationController
  before_filter :load_student
  
  def load_student
    @student = Student.find_by_person_id @user.id
  end
  
  def index
    @lectures = @student.lectures.current
    @schedule = @student.schedule
  end
end
