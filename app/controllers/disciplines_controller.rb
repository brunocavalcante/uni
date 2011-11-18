class DisciplinesController < ApplicationController
  def index
    @maximum_version_condition = "(version = (SELECT MAX(version) 
                                              FROM disciplines d2 
                                              WHERE d2.code = disciplines.code) OR 
                                              version IS NULL)";
    
    @conditions = @maximum_version_condition
    if (params[:term])
      @conditions = ["(name ILIKE ? OR code = ?) AND #{@maximum_version_condition}", 
                     '%' + params[:term] + '%', params[:term]]
    end
    
    @disciplines = Discipline.paginate :conditions => @conditions, 
                                       :page => params[:page], 
                                       :order => 'name ASC, version ASC'
    
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
