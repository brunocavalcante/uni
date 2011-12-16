class Admin::AcademicPeriodsController < ApplicationController
  respond_to :html, :xml, :json
  
  # GET /academic_periods
  def index
    @academic_periods = AcademicPeriod.by_start_date.paginate :page => params[:page]
    
    respond_with @academic_periods
  end

  # GET /academic_periods/1
  def show
    @academic_period = AcademicPeriod.find(params[:id])
    
    respond_with @academic_period
  end

  # GET /academic_periods/new
  def new
    @academic_period = AcademicPeriod.new
    
    respond_with @academic_period
  end

  # GET /academic_periods/1/edit
  def edit
    @academic_period = AcademicPeriod.find(params[:id])
  end

  # POST /academic_periods
  def create
    @academic_period = AcademicPeriod.new(params[:academic_period])
    @academic_period.save
    
    respond_with @academic_period, :location => [:admin, @academic_period]
  end

  # PUT /academic_periods/1
  def update
    @academic_period = AcademicPeriod.find(params[:id])
    @academic_period.update_attributes(params[:academic_period])

    respond_with @academic_period, :location => [:admin, @academic_period]
  end

  # DELETE /academic_periods/1
  def destroy
    @academic_period = AcademicPeriod.find(params[:id])
    @academic_period.destroy

    respond_with @academic_period, :location => admin_academic_periods_url
  end
end
