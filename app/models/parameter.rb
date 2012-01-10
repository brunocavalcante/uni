class Parameter < ActiveRecord::Base
  def self.load_param(param_name)
    @param = self.find_by_name(param_name)
    if !@param
      @param = self.new
      @param.name = param_name
    end
    
    return @param
  end
  
  def self.institution_name
    return self.load_param('institution_name').value != '' ? self.load_param('institution_name').value : 'Uni'
  end
  
  def self.auto_generate_student_code
    return self.load_param('auto_generate_student_code').value == 't'
  end
end
