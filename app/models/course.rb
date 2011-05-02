class Course < ActiveRecord::Base
  default_scope :order => 'name ASC'
  
  belongs_to :course_category
  has_many :curriculums
end
