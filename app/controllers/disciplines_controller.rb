class DisciplinesController < ApplicationController
  def index
    @conditions = nil
    if (params[:term])
      @conditions = ['name ILIKE ? OR code = ?', '%' + params[:term] + '%', params[:term]]
    end
    
    @disciplines = Discipline.paginate :conditions => @conditions, 
                                       :page => params[:page], 
                                       :order => 'name ASC'
    
    @disciplines_hash = []
    @disciplines.each do |discipline|
      @disciplines_hash << {"id" => discipline.code, "label" => discipline.code + ' - ' + discipline.name}
    end
    
    respond_to do |format|
      format.xml { render :xml => @disciplines }
      format.json { render :json => @disciplines }
      format.js { render :json => @disciplines_hash }
    end
  end
end
