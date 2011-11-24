class Update::ProfessorUpdate < Update::PersonUpdate
  def updates(professor)
    @lectures = professor.lectures
    @updates = lectures_updates(@lectures)
    order_updates(@updates)
    @updates = crop(@updates)
    
    return @updates
  end
end