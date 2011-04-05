class Prerequisito < ActiveRecord::Base
    belongs_to :cadeira, :class_name => 'Cadeira'
    belongs_to :requisito, :class_name => 'Cadeira'
end
