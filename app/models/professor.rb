class Professor < ActiveRecord::Base
  belongs_to :person, :dependent => :destroy
  
  has_many :lecture_professors, :dependent => :restrict
  has_many :lectures, :through => :lecture_professors

  accepts_nested_attributes_for :person
  
  scope :where_name, lambda {|term| where('people.name ILIKE ?', "%#{term}%") if term != ''}
  scope :by_person, includes(:person).order('people.name ASC')
  scope :with_scholarity, includes({:person => :scholarity})
  scope :where_active, lambda {|term| term == true ? where({:active => true}) : where('professors.active IS FALSE OR professors.active IS NULL')}
  
  validates_presence_of :email

  before_create :set_password
  before_create :set_roles
  before_destroy :delete_person
  after_initialize :init
  
  def email
    person.email
  end
  
  def name
    person.name
  end
  
  def to_xml(options = {})
    options[:include] ||= {:person => {:except => :password}}
    
    super(options)
  end
  
  def as_json(options = {})
    options[:include] ||= {:person => {:except => :password}}
    
    super(options)
  end
  
  private
    def set_password
      person.password = Digest::MD5.hexdigest(person.email)
      person.save
    end
    
    def set_roles
      self.person.roles = [Role.find_by_name('Professor')]
    end
    
    def init
      self.active = true if self.active == nil
    end
    
    def delete_person
      if !person.student
        person.destroy
      end
    end
end
