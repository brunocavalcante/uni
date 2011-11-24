class ProfessorsController < ApplicationController
  def index
    @professors = Professor.by_person
    @professors = @professors.where_name(params[:term]) if params[:term]
    @professors = Professor.paginate :page => params[:page]
    
    @professors_hash = []
    @professors.each do |professor|
      @professors_hash << {"id" => professor.id, "label" => professor.name}
    end
    
    respond_to do |format|
      format.xml { render :xml => @professors }
      format.json { render :json => @professors }
      format.js { render :json => @professors_hash }
    end
  end
end
