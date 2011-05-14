class UserController < ApplicationController
  def index
    @user = session[:user]
  end
end
