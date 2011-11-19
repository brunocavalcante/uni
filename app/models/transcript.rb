class Transcript < CurriculumStudent
  def name
    curriculum.name
  end
  
  def transcripts
    @curriculum_disciplines = curriculum.curriculum_disciplines.by_module 
    @lecture_students = student.lecture_students.by_date 
    @transferred_disciplines = transferred_disciplines.by_name
                              
    @transcripts = []
    @curriculum_disciplines.each {|c| @transcripts << {:discipline => c.discipline}}
    
    @best_lecture_students = {}
    for lecture_student in @lecture_students
      discipline_id = lecture_student.lecture.discipline_id
      if !@best_lecture_students[discipline_id] || @best_lecture_students[discipline_id].lecture_situation.approved == false
        @best_lecture_students[discipline_id] = lecture_student
      end
    end
    
    for transferred_discipline in @transferred_disciplines
      discipline_id = transferred_discipline.discipline_id
      if !@best_lecture_students[discipline_id] || @best_lecture_students[discipline_id].lecture_situation.approved == false
        @best_lecture_students[discipline_id] = transferred_discipline
      end
    end
    
    for transcript in @transcripts
      discipline_id = transcript[:discipline].id
      if @best_lecture_students[discipline_id]
        if @best_lecture_students[discipline_id].is_a? LectureStudent
          transcript[:lecture_student] = @best_lecture_students[discipline_id]
        elsif @best_lecture_students[discipline_id].is_a? TransferredDiscipline
          transcript[:transferred_discipline] = @best_lecture_students[discipline_id]
        end
        @best_lecture_students.delete discipline_id
      end 
    end
    
    if @best_lecture_students.size > 0
      for lecture_student in @best_lecture_students
        if lecture_student.is_a? LectureStudent
          @transcripts << {:discipline => lecture_student.lecture.discipline, :lecture_student => lecture_student}
        end
      end
    end
    
    return @transcripts
  end
end