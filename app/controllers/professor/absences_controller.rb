class Professor::AbsencesController < ApplicationController
  before_filter :load_lesson
  
  def load_lesson
    @lecture = Lecture.find params[:lecture_id]
    @lesson = Lesson.find params[:lesson_id]
  end
  
  def index
    load_students  
  end
  
  def load_students
    @lecture_students = LectureStudent.all :conditions => ['lecture_id = ?', params[:lecture_id]], 
                                           :include => [{:student => :person}], 
                                           :order => ['people.name ASC']
                                           
    @lesson_absences = LessonAbsence.all  :conditions => ['lesson_id = ?', @lesson.id], 
                                          :include => [{:lecture_student => {:student => :person}}], 
                                          :order => ['people.name ASC']
                                          
    @absences = {}
    @lecture_students.each { |lecture_student| @absences[lecture_student.id] = 0 }
    @lesson_absences.each { |lesson_absence| @absences[lesson_absence.lecture_student_id] = lesson_absence.ammount }
  end
  
  def create
    @lesson_absences = []
    
    (0..params[:lecture_student_id].size - 1).each do |i| 
      @lesson_absence = LessonAbsence.new
      @lesson_absence.lecture_student_id = params[:lecture_student_id][i]
      @lesson_absence.ammount = params[:lecture_student_ammount][i]
      @lesson_absences << @lesson_absence
    end
    
    @lesson.lesson_absences = @lesson_absences
    
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to({:action => "index"}, :notice => 'Object was successfully created.') }
        format.xml  { render :xml => @lecture_absence, :status => :created, :location => @lecture_absence }
      else
        format.html {
          @lecture_absence.lecture_student_absences.build
          load_students
          
          render :action => "new"
        }
        format.xml  { render :xml => @lecture_absence.errors, :status => :unprocessable_entity }
      end
    end
  end
end
