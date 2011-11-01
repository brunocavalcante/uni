class Admin::HomeController < ApplicationController
  def index
    @uni_version = '0.1'
    @ruby_version = RUBY_VERSION
    @rails_version = Rails::VERSION::STRING
  end
end