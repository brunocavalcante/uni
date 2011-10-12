class CourseCategory < ActiveRecord::Base
  validates :name, :presence => true
end
