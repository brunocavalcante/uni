class UserController < ApplicationController
  def index
    @student = Student.find_by_person_id(@user.id)
  end
  
  def show
    if (params[:id].to_i == @user.id)
      redirect_to :action => :index  
    end
    
    @person = Person.find(params[:id])
    @student = Student.find_by_person_id(@person.id)
  end
  
  def edit
    
  end
  
  def update
    respond_to do |format|
      sites = Array.new
      for site in params[:sites]
        if (site[:name] != '' && site[:url] != '')
          sites.push Site.new(:name => site[:name], :url => site[:url])
        end
      end
      @user.sites = sites
      
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
