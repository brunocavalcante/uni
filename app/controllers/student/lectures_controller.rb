class Student::LecturesController < LecturesController
  def index
    @student = Student.find_by_person_id(@user.id)
    @lectures = @student.current_lectures
  end
  
  def tests_and_abscences
    @student = Student.find_by_person_id(@user.id)
    @lecture_student = LectureStudent.find_by_lecture_id_and_student_id(@lecture.id, @student.id)
    @month_absences = @lecture_student.month_absences
  end
end
