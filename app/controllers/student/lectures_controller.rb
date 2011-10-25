class Student::LecturesController < LecturesController
  def index
    @student = Student.find_by_person_id(@user.id)
    @lectures = @student.current_lectures
  end
  
  def tests_and_abscences
  end
end
