class Admin::AdministratorsController < ApplicationController
  respond_to :html, :xml, :json
  
  before_filter :check_user_editing_himself_or_master
  skip_before_filter :check_user_editing_himself_or_master, :only => [:show]
  def check_user_editing_himself_or_master
    redirect_to({:action => 'index'}) if (params[:id] && params[:id].to_i == @user.id) || params[:id].to_i == 1
  end
  
  def index
    @administrators = Person.administrators.by_name.paginate :page => params[:page]
    
    respond_with @administrators
  end
  
  def new
    @administrator = Person.new
    
    respond_with @administrator
  end
  
  def create
    @administrator = Person.new params[:person]
    begin
      @administrator.setup_administrator
      @administrator.save!
      respond_with @administrator, :location => admin_administrator_path(@administrator)
    rescue
      render :new
    end
  end
  
  def show
    @administrator = Person.find params[:id]
    
    respond_with @administrator
  end
  
  def edit
    @administrator = Person.find params[:id]
    
    respond_with @administrator
  end
  
  def update
    @administrator = Person.find params[:id]
    begin
      @administrator.update_attributes params[:person]
      respond_with @administrator, :location => admin_administrator_path(@administrator)
    rescue
      render :edit
    end
  end
  
  def destroy
    @administrator = Person.find params[:id]
    @administrator.destroy
    
    respond_with @administrator, :location => admin_administrators_path
  end
end
