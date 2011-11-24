class Update::PersonUpdate
  def walls(lectures)
    Wall.from_lectures(lectures).with_message.by_date.limit(10)
  end
  
  def files(lectures)
    LectureFile.from_lectures(lectures).with_person.by_date.limit(10)
  end
  
  def lectures_updates(lectures)
    walls(lectures) | files(lectures)
  end
  
  def order_updates(updates)
    updates.sort! { |a,b| a.created_at <=> b.created_at }
    updates.reverse!
  end
  
  def crop(updates)
    updates[0..9]
  end
end