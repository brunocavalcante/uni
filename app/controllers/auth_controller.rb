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

        raise I18n.t('StudentNotFound') unless @aluno

        @person = @aluno.person
      end
      
      raise I18n.t('PersonNotFound') unless @person
      raise I18n.t('InvalidPassword') unless @person.password == Digest::MD5.hexdigest(params[:password])

      session[:role] = @person.roles[0] if @person.roles.length == 1
      session[:user] = @person.id
      
      redirect_to(root_url)
    rescue
      redirect_to(login_url, :alert => I18n.t('UserPasswordNotFound'))
    end
  end
  
  def profile
    
  end
  
  def logout
    session[:user] = nil
    session[:role] = nil
    redirect_to(login_url)
  end
end