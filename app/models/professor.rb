class Professor < ActiveRecord::Base
    belongs_to :pessoa
    belongs_to :curso
end
