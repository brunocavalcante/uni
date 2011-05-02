class CurriculumStudent < ActiveRecord::Base
  belongs_to :curriculum
  belongs_to :student
end
