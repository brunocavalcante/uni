class Professor < ActiveRecord::Base
    belongs_to :pessoa
    belongs_to :escolaridade
    has_many :curso
end
