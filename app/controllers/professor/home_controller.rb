class Professor::HomeController < ApplicationController
  def index
    @professor = Professor.find_by_person_id(@user.id)
    @updates = Update::ProfessorUpdate.new.updates(@professor)
  end
end
