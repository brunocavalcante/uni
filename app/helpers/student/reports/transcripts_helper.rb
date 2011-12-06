module Student::Reports::TranscriptsHelper
  def situation_class(lecture_student)
    return 'notice' unless lecture_student.lecture_situation_id
    return lecture_student.lecture_situation.approved ? 'success' : 'important'
  end
end
