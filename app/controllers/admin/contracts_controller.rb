class Admin::ContractsController < ApplicationController
  # GET /contracts
  def index
    @conditions = nil

    if params[:term]
      @conditions = ['student.name ILIKE ? OR code = ?', '%' + params[:term] + '%', '%' + params[:term] + '%']
    end

    @contracts = Contract.paginate :conditions => @conditions,
                                   :page => params[:page],
                                   :order => 'code'
  end

  # GET /contracts/1
  def show
  end

  # GET /contracts/new
  def new
  end

  # POST /contracts
  def create
  end

  # GET /contracts/1/edit
  def edit
  end

  # PUT /contracts/1
  def update
  end

  # DELETE /contracts/1
  def destroy
  end
end
