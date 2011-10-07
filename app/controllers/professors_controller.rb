class ProfessorsController < ApplicationController
  def index
    @conditions = nil
    if (params[:term])
      @conditions = ['people.name ILIKE ?', '%' + params[:term] + '%']
    end
    
    @professors = Professor.paginate :conditions => @conditions, 
                                     :include => [:person], 
                                     :page => params[:page], 
                                     :order => 'people.name ASC'
    
    @professors_hash = []
    @professors.each do |professor|
      @professors_hash << {"id" => professor.id, "label" => professor.name}
    end
    
    respond_to do |format|
      format.xml { render :xml => @professors }
      format.json { render :json => @professors.to_json(:include => [:person]) }
      format.js { render :json => @professors_hash }
    end
  end
end
