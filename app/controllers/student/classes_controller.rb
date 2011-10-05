class Student::ClassesController < ApplicationController
  before_filter :load_lecture
  
  def load_lecture
    if (params[:id])
      @lecture = Lecture.find(params[:id])
    end
  end
  
  def index
    @student = Student.find_by_person_id(@user.id)
    @lectures = @student.current_lectures
  end
  
  def show
  end
  
  def students
    @lecture_students = LectureStudent.paginate :conditions => ['lecture_id = ?', params[:id]], 
                                                :include => [{:student => :person}], 
                                                :page => params[:page], 
                                                :order => 'students.name ASC'
  end
  
  def files
  end
  
  def messages
  end
  
  def tests_and_abscences
  end
end
