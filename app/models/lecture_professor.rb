class LectureProfessor < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :professor
end
