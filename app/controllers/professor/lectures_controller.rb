class Professor::LecturesController < LecturesController
  before_filter :load_professor
  
  def load_professor
    @professor = Professor.find_by_person_id(@user.id)
  end
  
  def index
    @lectures = @professor.current_lectures
  end
end
