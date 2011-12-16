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
    
    # This array saves the best performances per discipline for each lecture_student or transferred_discipline
    @best_lecture_students = {}
    for item in @lecture_students | @transferred_disciplines
      discipline_code = item.discipline_code
      if !@best_lecture_students[discipline_code] || (@best_lecture_students[discipline_code].is_failed? && !item.is_failed)
        @best_lecture_students[discipline_code] = item
      end
    end
    
    # Adds the best performances to the transcript
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
          equivalents_codes = lecture_student.lecture.discipline.equivalents_codes
          # Check if this discipline has a equivalent in the curriculum
          for t in @transcripts
            if equivalents_codes.include?(t[:curriculum_discipline].discipline.code)
              # Check if this lecture_student's performance is better than the original one, if it exists
              if t[:lecture_student] == nil or (t[:lecture_student].is_failed? && !lecture_student.is_failed?)
                t[:lecture_student] = lecture_student
              end
            end 
          end
        elsif lecture_student.is_a? TransferredDiscipline
          @transcripts << {:discipline => lecture_student.discipline, :transferred_discipline => lecture_student}
        end
      end
    end
    
    return @transcripts
  end
end