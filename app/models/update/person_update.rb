class Update::PersonUpdate
  def walls(lectures)
    Wall.from_lectures(lectures).with_message.by_date
  end
  
  def files(lectures)
    LectureFile.from_lectures(lectures).with_person.by_date
  end
  
  def lectures_updates(lectures)
    walls(lectures) | files(lectures)
  end
  
  def order_updates(updates)
    updates.sort! { |a,b| a.created_at <=> b.created_at }
    updates.reverse!
  end
end