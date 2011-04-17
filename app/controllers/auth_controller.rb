class AuthController < ApplicationController
  def login
  end
  
  def authenticate
    session[:user] = params[:username]
    redirect_to(root_url)
  end
  
  def logout
    session[:user] = nil
    redirect_to(login_url, :notice => 'Logout realizado com sucesso')
  end
end