class Admin::ParametrosController < ApplicationController
  def index
    
  end
  
  def update
    if params[:locale]
      session[:locale] = params[:locale]
    end
    
    redirect_to :action => 'index'
  end
end
