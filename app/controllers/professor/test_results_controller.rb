class Professor::TestResultsController < ApplicationController
  before_filter :load_test
  
  def load_test
    @lecture = Lecture.find params[:lecture_id]
    @test = Test.find params[:test_id]
  end
  
  def index
    load_students
  end
  
  def load_students
    @lecture_students = LectureStudent.all :conditions => ['lecture_id = ?', params[:lecture_id]], 
                                           :include => [{:student => :person}], 
                                           :order => ['people.name ASC']
                                           
    @test_results = TestResult.all  :conditions => ['test_id = ?', @test.id], 
                                          :include => [{:lecture_student => {:student => :person}}], 
                                          :order => ['people.name ASC']
                                          
    @results = {}
    
    @lecture_students.each do |lecture_student| 
      @results[lecture_student.id] = {}
      @results[lecture_student.id][:rating] = nil
      @results[lecture_student.id][:date] = nil
    end
    
    @test_results.each do |test_result|
      @results[test_result.lecture_student_id][:rating] = test_result.rating
      @results[test_result.lecture_student_id][:date] = test_result.date
    end
  end
  
  def create
    @test_results = []
    
    (0..params[:lecture_student_id].size - 1).each do |i| 
      @test_result = TestResult.new
      @test_result.lecture_student_id = params[:lecture_student_id][i]
      @test_result.rating = params[:lecture_student_rating][i]
      @test_result.date = Time.zone.local(*params[:lecture_student_date][i].sort.map(&:last).map(&:to_i))
      @test_results << @test_result
    end
    
    @test.test_results = @test_results
    
    respond_to do |format|
      if @test.save
        format.html { redirect_to({:action => "index"}, :notice => I18n.t('TestUpdated')) }
        format.xml  { render :xml => @lecture_result, :status => :created, :location => @lecture_result }
      else
        format.html {
          @lecture_result.lecture_student_results.build
          load_students
          
          render :action => "new"
        }
        format.xml  { render :xml => @lecture_result.errors, :status => :unprocessable_entity }
      end
    end
  end
end
