class SearchController < ApplicationController
  def all
    @query = params[:globalSearch]
    
    @students = Student.by_name.where_code_or_name(@query)
    @students.limit = 10
    
    @professors = Professor.by_person.where_name(@query)
    @professors.limit = 10
  end
end
