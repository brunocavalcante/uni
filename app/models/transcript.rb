class Transcript < CurriculumStudent
  def name
    curriculum.name
  end
  
  def transcripts
    @curriculum_disciplines = curriculum.curriculum_disciplines.by_module 
    @lecture_students = student.lecture_students.by_date 
    @transferred_disciplines = transferred_disciplines.by_name
                              
    @transcripts = []
    @curriculum_disciplines.each {|c| @transcripts << {:curriculum_discipline => c}}
    
    @best_lecture_students = {}
    for lecture_student in @lecture_students
      discipline_code = lecture_student.lecture.discipline.code
      if !@best_lecture_students[discipline_code] || @best_lecture_students[discipline_code].lecture_situation.approved == false
        @best_lecture_students[discipline_code] = lecture_student
      end
    end
    
    for transferred_discipline in @transferred_disciplines
      discipline_code = transferred_discipline.discipline.code
      if !@best_lecture_students[discipline_code] || @best_lecture_students[discipline_code].lecture_situation.approved == false
        @best_lecture_students[discipline_code] = transferred_discipline
      end
    end
    
    for transcript in @transcripts
      discipline_code = transcript[:curriculum_discipline].discipline.code
      if @best_lecture_students[discipline_code]
        if @best_lecture_students[discipline_code].is_a? LectureStudent
          transcript[:lecture_student] = @best_lecture_students[discipline_code]
        elsif @best_lecture_students[discipline_code].is_a? TransferredDiscipline
          transcript[:transferred_discipline] = @best_lecture_students[discipline_code]
        end
        @best_lecture_students.delete discipline_code
      end 
    end
    
    # Disciplines not on the curriculum
    if @best_lecture_students.size > 0
      for id, lecture_student in @best_lecture_students
        if lecture_student.is_a? LectureStudent
          @transcripts << {:discipline => lecture_student.lecture.discipline, :lecture_student => lecture_student}
        elsif lecture_student.is_a? TransferredDiscipline
          @transcripts << {:discipline => lecture_student.discipline, :transferred_discipline => lecture_student}
        end
      end
    end
    
    return @transcripts
  end
end