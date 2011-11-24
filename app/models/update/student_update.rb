class Update::StudentUpdate < Update::PersonUpdate
  def updates(student)
    @lectures = student.lectures
    @updates = lectures_updates(@lectures)
    order_updates(@updates)
    @updates = crop(@updates)
    
    return @updates
  end
end