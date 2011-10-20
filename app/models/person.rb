class Person < ActiveRecord::Base
  has_many :personroles, :foreign_key => 'person_id', :class_name => 'PersonRole'
  has_many :roles, :through => :personroles
  has_many :sites, :dependent => :destroy
  has_attached_file :photo, :styles => { :small => "75x75#", :medium => "180x240#", :thumb => "100x100#" }
  
  validates :name, :presence => true
end
