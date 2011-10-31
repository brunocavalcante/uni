class Professor::LectureAbsencesController < ApplicationController
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
  
  def index
    @lecture_absences = LectureAbsence.paginate :conditions => ['lecture_id = ?', params[:lecture_id]], 
                                                :page => params[:page], 
                                                :order => ['date DESC']
  end
  
  def new
    @lecture_absence = LectureAbsence.new
    @lecture_absence.lecture_student_absences.build
    
    load_students
  end
  
  def load_students
    @lecture_students = LectureStudent.all :conditions => ['lecture_id = ?', params[:lecture_id]], 
                                           :include => [{:student => :person}], 
                                           :order => ['people.name ASC']
  end
  
  def create
    @lecture_absence = LectureAbsence.new(params[:lecture_absence])
    @lecture_absence.lecture = @lecture
    
    respond_to do |format|
      if @lecture_absence.save
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
  
  def show
    @lecture_absence = LectureAbsence.find(params[:id])
    
    @lecture_student_absences = LectureStudentAbsence.all :conditions => ['lecture_absences.lecture_id = ? AND 
                                                                           lecture_absence_id = ?', 
                                                                           params[:lecture_id], 
                                                                           params[:id]], 
                                                          :include => [:lecture_absence, 
                                                                       {:lecture_student => {:student => :person}}], 
                                                          :order => ['people.name ASC']
  end
  
  def edit
    @lecture_absence = LectureAbsence.find(params[:id])
    @lecture_absence.lecture_student_absences.build
    @lecture_students = @lecture.students
    
    @lecture_student_absences = LectureStudentAbsence.all :conditions => ['lecture_absences.lecture_id = ?', 
                                                                          params[:lecture_id]], 
                                                          :include => [:lecture_absence, 
                                                                       {:lecture_student => {:student => :person}}], 
                                                          :order => ['people.name ASC']
  end
  
  def update
    @lecture_absence = LectureAbsence.find(params[:id])
    
    respond_to do |format|
      if @lecture_absence.update_attributes(params[:lecture_absence])
        format.html { redirect_to({:action => "show"}, :notice => 'Object was successfully updated.') }
        format.xml  { render :xml => @lecture_absence, :status => :created, :location => @lecture_absence }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @lecture_absence.errors, :status => :unprocessable_entity }
      end
    end
  end
end
