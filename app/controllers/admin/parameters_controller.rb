class Admin::ParametersController < ApplicationController
  def index
    
  end
  
  def update
    if params[:locale]
      @locale = Parameter.find_by_name('locale')
      @locale.value = params[:locale]
      @locale.save
    end
    
    redirect_to :action => 'index'
  end
end
