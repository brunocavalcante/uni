class Message < ActiveRecord::Base
  belongs_to :person
  has_one :wall
  
  validates_presence_of :person_id, :content
end
