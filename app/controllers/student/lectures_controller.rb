class Student::LecturesController < LecturesController
  before_filter :load_lecture_student
  
  def load_lecture_student
    @student = Student.find_by_person_id(@user.id)
    if params[:id]
      @lecture_student = LectureStudent.find_by_lecture_id_and_student_id(params[:id], @student.id)
      
      if !@lecture_student
        redirect_to({:controller => :home}, :alert => I18n.t('YouDontHaveAccessToThisLecture'))
      end
      
      @course = @lecture_student.lecture.discipline.course
      @curriculum_student = @student.curriculum_students.from_course(@course.id).first
      
      if @curriculum_student && !@curriculum_student.active?
        redirect_to({:controller => :home}, :alert => I18n.t('YouAreInactiveInThisCourse', :course => @course.name))
      end
    end
  end
  
  def index
    @lectures = @student.lectures.current
    
    respond_with @lectures
  end
  
  def tests_and_absences
    @month_absences = @lecture_student.month_absences
    @tests_and_results = @lecture_student.tests_and_results
    
    respond_with [{:tests => @tests_and_results, :absences => @month_absences}]
  end
end
