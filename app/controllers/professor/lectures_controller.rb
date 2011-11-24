class Professor::LecturesController < LecturesController
  before_filter :load_professor
  before_filter :check_pending_student_situations
  
  def load_professor
    @professor = Professor.find_by_person_id(@user.id)
    
    if params[:id]
      @lecture_professor = LectureProfessor.find_by_lecture_id_and_professor_id(params[:id], @professor.id)
      redirect_to({:controller => :home}, :alert => 'YouDontHaveAccessToThisLecture') unless @lecture_professor
    end
  end
  
  def check_pending_student_situations
    if @lecture && @lecture.academic_period.close_to_conclusion? && @lecture.has_pending_student_situations?
      flash.now[:notice] = I18n.t("LectureCloseToConclusionPendingStudentsNotice")
    end
  end
  
  def index
    @lectures = @professor.lectures.current
  end
end
