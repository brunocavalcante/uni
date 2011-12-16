class Person < ActiveRecord::Base
  belongs_to :scholarity
  
  has_many :personroles, :foreign_key => 'person_id', :class_name => 'PersonRole', :dependent => :destroy
  has_many :roles, :through => :personroles
  has_many :sites, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  
  has_one :professor
  has_one :student
  
  has_attached_file :photo, :styles => { :small => "75x75#", :medium => "180x240#", :thumb => "32x32#" }
  
  validates :name, :presence => true
  validates_uniqueness_of :email
  
  scope :by_name, order('people.name ASC')
  scope :where_name, lambda {|term| where(['people.name ILIKE ?', "%#{term}%"]) if term != ''}
  scope :with_scholarity, includes(:scholarity)
  scope :administrators, includes(:roles).where('person_roles.role_id = ?', Role::ADMINISTRATOR)
  
  def as_json(options = {})
    options[:except] ||= :password
    
    super(options)
  end
  
  def is_admin?
    for role in roles
      return true if role.id == Role::ADMINISTRATOR
    end
    
    return false
  end
  
  def setup_administrator
    self.roles = [Role.find(Role::ADMINISTRATOR)]
    self.password = Digest::MD5.hexdigest(self.email)
  end
end
