class CurriculumStudent < ActiveRecord::Base
  belongs_to :curriculum
  belongs_to :student
  
  validates :curriculum_id, :presence => true
  validates :student_id, :presence => true
  
  has_many :transferred_disciplines, :dependent => :destroy
  
  validates_uniqueness_of :student_id, :scope => :curriculum_id
  
  def name
    student.name
  end
  
  def transcripts
    @curriculum_disciplines = CurriculumDiscipline.by_module.where(:curriculum_id => curriculum.id) 
    @lecture_students = LectureStudent.by_date.where(:student_id => student.id) 
    @transferred_disciplines = TransferredDiscipline.by_name.where(:curriculum_student_id => id)
                                           
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
        @transcripts << {:discipline => lecture_student.lecture.discipline, :lecture_student => lecture_student}
      end
    end
    
    return @transcripts
  end
  
  def to_xml(options = {})
    options[:include] ||= {:student => {:include => :person}}
    
    super(options)
  end
  
  def as_json(options = {})
    options[:include] ||= {:student => {:include => :person}}
    
    super(options)
  end
end
