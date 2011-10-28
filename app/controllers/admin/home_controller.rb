class Admin::HomeController < ApplicationController
  def index
    @uni_version = '0.1'
    @ruby_version = '1.9.2'
    @rails_version = '3.1.0'
  end
end