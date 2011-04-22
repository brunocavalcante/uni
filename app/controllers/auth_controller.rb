require 'digest/md5'

class AuthController < ApplicationController
  def login
  end
  
  def authenticate
    begin
      if /@/.match(params[:username])
        @pessoa = Pessoa.find_by_email(params[:username])
      else
        @aluno = Aluno.find_by_matricula(params[:username])
        if !@aluno
          raise 'Aluno não encontrado'
        end
        @pessoa = @aluno.pessoa
      end
      if !@pessoa
        raise 'Pessoa não encontrada'
      end
      if @pessoa.senha != Digest::MD5.hexdigest(params[:password])
        raise 'Senha inválida'
      end
      if @pessoa.perfis.length == 1
        session[:profile] = @pessoa.perfis[0]
      end
      session[:user] = @pessoa
      redirect_to(root_url)
    rescue
      redirect_to(login_url, :alert => 'Usuário/senha não encontrados')
    end
  end
  
  def profile
    
  end
  
  def logout
    session[:user] = nil
    session[:profile] = nil
    redirect_to(login_url, :notice => 'Logout realizado com sucesso')
  end
end