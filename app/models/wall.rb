class Wall < ActiveRecord::Base
  belongs_to :message
  belongs_to :lecture
  
  validates_presence_of :message_id, :lecture_id
end
