module Student::ReportsHelper
  def situation_class(lecture_student)
    return 'in-progress' unless lecture_student.lecture_situation_id
    return lecture_student.lecture_situation.approved ? 'approved' : 'failed'
  end
end
