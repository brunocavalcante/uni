class UserController < ApplicationController
  def index
    @student = Student.find_by_person_id(@user.id)
    @professor = Professor.find_by_person_id(@user.id)
  end
  
  def show
    if (params[:id].to_i == @user.id)
      redirect_to :action => :index  
    end
    
    @person = Person.find(params[:id])
    @student = Student.find_by_person_id(@person.id)
    @professor = Professor.find_by_person_id(@person.id)
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
      
      if params[:password][:new] != ''
        if Digest::MD5.hexdigest(params[:password][:current]) != @user.password
          @user.errors.add :password
        elsif params[:password][:new] != params[:password][:repeat]
          @user.errors.add :password, I18n.t('PleaseRepeatNewPassword')
        else
          params[:user][:password] = Digest::MD5.hexdigest(params[:password][:new])
        end
      end
      
      if @user.errors.size == 0 && @user.update_attributes(params[:user])
        format.html { redirect_to({:action => 'index'}, :notice => I18n.t('flash.user.update.notice')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
