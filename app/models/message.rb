class Message < ActiveRecord::Base
  belongs_to :person
  has_one :wall, :dependent => :destroy
  
  validates_presence_of :person_id, :content
end
