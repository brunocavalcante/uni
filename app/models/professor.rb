class Professor < ActiveRecord::Base
    belongs_to :pessoa
    belongs_to :escolaridade
    has_many :curso
    
    accepts_nested_attributes_for :pessoa
    
    def nome
      pessoa.nome
    end
end
