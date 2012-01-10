class Admin::ParametersController < ApplicationController
  def index
    @auto_generate_student_code = Parameter.load_param('auto_generate_student_code')
    @institution_name = Parameter.load_param('institution_name')
  end
  
  def update
    #Locale
    if params[:locale]
      @locale = Parameter.find_by_name('locale')
      @locale.value = params[:locale]
      @locale.save
    end
    
    #Auto Generate Student Code
    @auto_generate_student_code = Parameter.load_param('auto_generate_student_code')
    if (params[:auto_generate_student_code] != nil)
      @auto_generate_student_code.value = 't'
    else
      @auto_generate_student_code.value = 'f'
    end
    @auto_generate_student_code.save
    
    #Institution
    @institution_name = Parameter.load_param('institution_name')
    @institution_name.value = params[:institution_name]
    @institution_name.save
    
    redirect_to :action => 'index'
  end
end
