class DisciplinesController < ApplicationController
  def index
    @disciplines = Discipline.latest_versions
    @disciplines = @disciplines.where_code_or_name(params[:term]) if params[:term]
    @disciplines = @disciplines.paginate :page => params[:page] 
    
    @disciplines_hash = []
    @disciplines.each do |discipline|
      @disciplines_hash << {"id" => discipline.id, "label" => discipline.full_name}
    end
    
    respond_to do |format|
      format.xml { render :xml => @disciplines }
      format.json { render :json => @disciplines }
      format.js { render :json => @disciplines_hash }
    end
  end
end
