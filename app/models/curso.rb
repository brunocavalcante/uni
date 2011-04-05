class Curso < ActiveRecord::Base
    belongs_to :categoria_curso
    has_many :cadeiras
end
