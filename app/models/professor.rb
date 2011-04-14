class Professor < ActiveRecord::Base
    belongs_to :pessoa
    belongs_to :escolaridade
    
    accepts_nested_attributes_for :pessoa
    
    def nome
      pessoa.nome
    end
end
