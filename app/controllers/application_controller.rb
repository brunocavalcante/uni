class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  before_filter :login_required
  
  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    I18n.locale = session[:locale]
  end
  
  def login_required
    if (!session[:user] and params[:controller] != 'auth')
      redirect_to(login_url)
    end
  end
  
end
