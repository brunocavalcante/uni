class Pessoa < ActiveRecord::Base
  has_many :perfilpessoas, :foreign_key => 'pessoa_id', :class_name => 'PerfilPessoa'
  has_many :perfis, :through => :perfilpessoas
end
