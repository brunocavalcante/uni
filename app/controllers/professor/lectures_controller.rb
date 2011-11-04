class Professor::LecturesController < LecturesController
  before_filter :load_professor
  
  def load_professor
    @professor = Professor.find_by_person_id(@user.id)
    
    if params[:id]
      @lecture_professor = LectureProfessor.find_by_lecture_id_and_professor_id(params[:id], @professor.id)
      redirect_to({:controller => :home}, :alert => 'YouDontHaveAccessToThisLecture') unless @lecture_professor
    end
  end
  
  def index
    @lectures = @professor.current_lectures
  end
end
