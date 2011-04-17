class PerfilPessoa < ActiveRecord::Base
  belongs_to :perfil
  belongs_to :pessoa
end
