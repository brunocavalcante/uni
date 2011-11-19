class Student < ActiveRecord::Base
  belongs_to :person
  has_many :curriculum_students, :dependent => :destroy
  has_many :curriculums, :through => :curriculum_students
  
  has_many :lecture_students, :dependent => :destroy
  has_many :lectures, :through => :lecture_students
  
  scope :by_name, includes(:person).order('people.name ASC')
  
  validates_uniqueness_of :code
  
  accepts_nested_attributes_for :person
    
  def to_param
    code
  end

  def name
    person.name
  end
  
  def schedule
    @schedule = {}
    
    @today = Date.today
    @limit_date = @today >> 1.month
    
    @lectures = self.lectures.current
    
    for lecture in @lectures
      # Lessons
      @lessons = Lesson.all :conditions => ["lecture_id = ? AND date >= ? AND date <= ?", 
                                            lecture.id, 
                                            @today.to_s, 
                                            @limit_date.to_s], 
                                            :order => 'date ASC'
      # Tests
      @tests = Test.all :conditions => ["lecture_id = ? AND date >= ? AND date <= ?", 
                                        lecture.id, 
                                        @today.to_s, 
                                        @limit_date.to_s], 
                                        :order => ['date ASC']
      
      @events = @lessons + @tests
      
      for event in @events
        event_day = event.date.strftime("%Y-%m-%d") 
        @schedule[event_day] = [] if @schedule[event_day] == nil
        @schedule[event_day] << event
      end
    end
    
    # Ordering by the day
    @schedule.sort
    @schedule = @schedule.sort { |a, b| Date.parse(a[0]) <=> Date.parse(b[0]) }
    
    # Ordering the events by their time
    @schedule.each { |day, events| events.sort_by! { |event| event.date } }
    
    return @schedule 
  end
end
