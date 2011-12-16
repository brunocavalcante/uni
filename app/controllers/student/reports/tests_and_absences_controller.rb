class Student::Reports::TestsAndAbsencesController < ApplicationController
  def index
    @student = Student.find_by_person_id(@user.id)
    @lecture_students = @student.lecture_students.current
    
    @month_absences = {}
    @tests_and_results = {}
    
    @lecture_students.each do |l|
      @month_absences[l.id] = l.month_absences
      @tests_and_results[l.id] = l.tests_and_results
    end
    
    respond_with [{:tests => @tests_and_results, :absences => @month_absences}]
  end
end
