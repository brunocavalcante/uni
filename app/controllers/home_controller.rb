class HomeController < ApplicationController
  def index
    case session[:role].id
      when Role::ADMINISTRATOR
        redirect_to(admin_root_url)
      when Role::PROFESSOR
        redirect_to(professor_root_url)
      when Role::STUDENT
        redirect_to(student_root_url)
      else
        redirect_to(login_url)
    end
  end
end
