class Professor::LectureStudentsController < ApplicationController
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
  
  def index
    @lecture_students = LectureStudent.paginate :conditions => ['lecture_id = ?', params[:lecture_id]], 
                                                :include => [{:student => :person}], 
                                                :page => params[:page], 
                                                :order => 'people.name ASC'
  end
  
  def show
    @lecture_student = LectureStudent.find params[:id]
    @month_absences = @lecture_student.month_absences
  end
end
