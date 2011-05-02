require 'digest/md5'

class AuthController < ApplicationController
  
  skip_before_filter :login_required
  
  def login
  end
  
  def authenticate
    begin
      if /@/.match(params[:username])
        @person = Person.find_by_email(params[:username])
      else
        @aluno = Student.find_by_code(params[:username])
        if !@aluno
          raise 'Aluno não encontrado'
        end
        @person = @aluno.person
      end
      if !@person
        raise 'Pessoa não encontrada'
      end
      if @person.password != Digest::MD5.hexdigest(params[:password])
        raise 'Senha inválida'
      end
      if @person.roles.length == 1
        session[:role] = @person.roles[0]
      end
      session[:user] = @person
      redirect_to(root_url)
    rescue
      redirect_to(login_url, :alert => 'Usuário/senha não encontrados')
    end
  end
  
  def profile
    
  end
  
  def logout
    session[:user] = nil
    session[:role] = nil
    redirect_to(login_url, :notice => 'Logout realizado com sucesso')
  end
end