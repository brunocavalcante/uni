class Student::HomeController < ApplicationController
  def index
    @student = Student.find_by_person_id(@user.id)
    @updates = Update::StudentUpdate.new.updates(@student)
        
    @schedule = @student.schedule
  end
end
