class CurriculumDiscipline < ActiveRecord::Base
  belongs_to :curriculum
  belongs_to :discipline
end
