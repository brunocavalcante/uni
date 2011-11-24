class LectureStudent < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :student
  belongs_to :lecture_situation
  
  has_many :lesson_absences, :dependent => :destroy
  has_many :test_results, :dependent => :destroy
  
  scope :by_date, includes([{:lecture => [:discipline, :academic_period]}]).order('academic_periods.start ASC') 
  scope :current, where(['academic_periods.start <= ? AND academic_periods.end >= ?', Date.today.to_s, Date.today.to_s]).includes([{:lecture => [:academic_period, :discipline]}]) 
  scope :by_name, includes({:student => :person}).order('people.name ASC')
  scope :pending, where('lecture_students.lecture_situation_id IS NULL')
  
  validates :lecture_id, :presence => true
  validates :student_id, :presence => true
  
  validates_presence_of :grade, :if => :lecture_situation_id?
  validates_presence_of :attendance, :if => :lecture_situation_id?
  validates_presence_of :lecture_situation_id, :if => :grade? || :attendance?
  
  def name
    student.name
  end
  
  def month_absences
    @lesson_absences = LessonAbsence.all :conditions => ['lecture_student_id = ?', id], 
                                         :include => [:lesson], 
                                         :order => ['lessons.date ASC']
                                                          
    @month_absences = {}
    (lecture.academic_period.start.month .. lecture.academic_period.end.month).each {|i| @month_absences[i] = nil}
    
    for lesson_absence in @lesson_absences
      if @month_absences[lesson_absence.lesson.date.month] == nil
        @month_absences[lesson_absence.lesson.date.month] = 0
      end
      @month_absences[lesson_absence.lesson.date.month] += lesson_absence.ammount
    end
    
    return @month_absences
  end
  
  def situation_description
    I18n.t (lecture_situation_id ? lecture_situation.name : 'InProgress')
  end
  
  def tests_and_results
    @tests_and_results = {}
    
    @tests = Test.all :conditions => ['lecture_id = ?', lecture.id], :order => ['date ASC']
    @tests.each do |test|
      @tests_and_results[test.id] = {}
      @tests_and_results[test.id][:test] = test
      @tests_and_results[test.id][:result] = nil
    end
    
    @test_results = TestResult.all :conditions => ['lecture_student_id = ?', id]
    @test_results.each do |test_result|
      @tests_and_results[test_result.test_id][:result] = test_result
    end
    
    return @tests_and_results
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
