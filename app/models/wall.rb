class Wall < ActiveRecord::Base
  belongs_to :message
  belongs_to :lecture
  
  accepts_nested_attributes_for :message
  
  validates_presence_of :lecture_id
  
  scope :from_lectures, lambda {|lectures| where('lecture_id IN (?)', lectures.map(&:id))}
  scope :with_message, includes({:message => :person})
  scope :by_date, order('walls.created_at DESC')
  
  def to_xml(options = {})
    options[:include] ||= {:message => {:include => {:person => {:except => :password}}}}
    
    super(options)
  end
  
  def as_json(options = {})
    options[:include] ||= {:message => {:include => {:person => {:except => :password}}}}
    
    super(options)
  end
end
