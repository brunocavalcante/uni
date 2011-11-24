class Professor::HomeController < ApplicationController
  before_filter :check_pending_student_situations
  
  def check_pending_student_situations
    @professor = Professor.find_by_person_id(@user.id)
    for lecture in @professor.lectures.current
      if lecture.academic_period.close_to_conclusion? && lecture.has_pending_student_situations?
        flash.now[:notice] = I18n.t("AcademicPeriodCloseToConclusionPendingStudentsNotice")
        break
      end
    end
  end
  
  def index
    @professor = Professor.find_by_person_id(@user.id)
    @updates = Update::ProfessorUpdate.new.updates(@professor)
  end
end
