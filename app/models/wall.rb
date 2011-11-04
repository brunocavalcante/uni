class Wall < ActiveRecord::Base
  belongs_to :message, :dependent => :destroy
  belongs_to :lecture
  
  accepts_nested_attributes_for :message
  
  validates_presence_of :lecture_id
end
