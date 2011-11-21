class Student::LecturesController < LecturesController
  before_filter :load_lecture_student
  
  def load_lecture_student
    @student = Student.find_by_person_id(@user.id)
    if params[:id]
      @lecture_student = LectureStudent.find_by_lecture_id_and_student_id(params[:id], @student.id)
      
      redirect_to({:controller => :home}, :alert => I18n.t('YouDontHaveAccessToThisLecture')) unless @lecture_student
      
      @course = @lecture_student.lecture.discipline.course
      @curriculum_student = CurriculumStudent.first :conditions => ['curriculum_id IN (?) AND student_id = ?', 
                                                                    @course.curriculums.map(&:id), @student.id]
      
      if @curriculum_student && @curriculum_student.active == false
        redirect_to({:controller => :home}, :alert => I18n.t('YouAreInactiveInThisCourse', :course => @course.name))
      end
    end
  end
  
  def index
    @lectures = @student.lectures.current
    
    respond_with @lectures
  end
  
  def tests_and_abscences
    @student = Student.find_by_person_id(@user.id)
    @lecture_student = LectureStudent.find_by_lecture_id_and_student_id(@lecture.id, @student.id)
    
    @month_absences = @lecture_student.month_absences
    @tests_and_results = @lecture_student.tests_and_results
    
    respond_with [{:tests => @tests_and_results, :absences => @month_absences}]
  end
end
