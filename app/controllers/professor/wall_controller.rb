class Professor::WallController < WallController
  before_filter :load_professor
  
  def load_professor
    @professor = Professor.find_by_person_id(@user.id)
  end
end