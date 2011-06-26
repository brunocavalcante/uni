class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  before_filter :login_required
  before_filter :load_user
  before_filter :translate_will_paginate
  
  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    @localeParameter = Parameter.find_by_name('locale')
    if @localeParameter
      I18n.locale = @localeParameter.value
    end
  end
  
  def login_required
    if !session[:user]
      redirect_to(login_url)
    elsif !session[:role]
      redirect_to(profile_url)
    end
  end
  
  def load_user
    if session[:user]
      @user = Person.find(session[:user])
    end
  end
  
  def translate_will_paginate
    WillPaginate::ViewHelpers.pagination_options[:previous_label] = '&larr; ' + (I18n.t 'Previous')
    WillPaginate::ViewHelpers.pagination_options[:next_label] = (I18n.t 'Next') + ' &rarr;'
  end
  
end
