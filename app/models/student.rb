class Student < ActiveRecord::Base
  belongs_to :person
  has_many :curriculum_students, :dependent => :destroy
  has_many :curriculums, :through => :curriculum_students
  
  has_many :lecture_students, :dependent => :destroy
  has_many :lectures, :through => :lecture_students
  
  scope :where_code_or_name, lambda {|term| where(['people.name ILIKE ? OR code = ?', "%#{term}%", term]) if term != ''}
  scope :by_name, includes(:person).order('people.name ASC')
  
  validates_presence_of :code
  validates_uniqueness_of :code
  
  accepts_nested_attributes_for :person
  
  before_create :set_password
  before_create :set_roles
  before_destroy :delete_person
    
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
  
  def get_next_code
    @today = Time.new
    #[YEAR][MONTH][SECOND][SEQUENTIAL]
    return "#{@today.year}#{@today.strftime('%m')}#{@today.strftime('%S')}#{Student.count + 1}"
  end
  
  private
    def set_password
      person.password = Digest::MD5.hexdigest(self.code)
      person.save
    end
    
    def set_roles
      self.person.roles = [Role.find_by_name('Student')]
    end
    
    def delete_person
      if !person.professor
        person.destroy
      end
    end
end
