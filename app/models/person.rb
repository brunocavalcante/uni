class Person < ActiveRecord::Base
  has_many :personroles, :foreign_key => 'person_id', :class_name => 'PersonRole'
  has_many :roles, :through => :personroles
end
