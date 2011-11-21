class LectureUpdate < PersonUpdate
  def updates(lecture)
    @updates = lectures_updates([lecture])
    order_updates(@updates)
    
    return @updates
  end
end