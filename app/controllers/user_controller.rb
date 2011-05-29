class UserController < ApplicationController
  def index
    
  end
  
  def edit
    
  end
  
  def update
    respond_to do |format|
      if params[:delete_photo]
        params[:photo] = nil
        @user.photo = nil
      end
      
      if @user.update_attributes(params[:user])
        format.html { redirect_to({:action => 'index'}, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
