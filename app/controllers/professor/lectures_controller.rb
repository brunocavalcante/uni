class Professor::LecturesController < LecturesController
  def index
    @professor = Professor.find_by_person_id(@user.id)
    @lectures = @professor.current_lectures
  end
end
