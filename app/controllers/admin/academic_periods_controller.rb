class Admin::AcademicPeriodsController < ApplicationController
  # GET /academic_periods
  def index
    @academic_periods = AcademicPeriod.paginate :page => params[:page]
    
    throw RUBY_VERSION
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @academic_periods }
      format.json { render :json => @academic_periods }
    end
  end

  # GET /academic_periods/1
  def show
    @academic_period = AcademicPeriod.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @academic_period }
      format.json { render :json => @academic_period }
    end
  end

  # GET /academic_periods/new
  def new
    @academic_period = AcademicPeriod.new
  end

  # GET /academic_periods/1/edit
  def edit
    @academic_period = AcademicPeriod.find(params[:id])
  end

  # POST /academic_periods
  def create
    @academic_period = AcademicPeriod.new(params[:academic_period])
    
    respond_to do |format|
      if @academic_period.save
        format.html { redirect_to([:admin, @academic_period], :notice => 'Academic Period was successfully created.') }
        format.xml  { render :xml => @academic_period, :status => :created, :location => @academic_period }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @academic_period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /academic_periods/1
  def update
    @academic_period = AcademicPeriod.find(params[:id])

    respond_to do |format|
      if @academic_period.update_attributes(params[:academic_period])
        format.html { redirect_to([:admin, @academic_period], :notice => 'Academic Period was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @academic_period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_periods/1
  def destroy
    @academic_period = AcademicPeriod.find(params[:id])
    @academic_period.destroy

    redirect_to(admin_academic_periods_url)
  end
end
