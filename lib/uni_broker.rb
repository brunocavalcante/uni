class UniBroker
  include Singleton
  
  def initialize
    @plugins = []
  end
  
  def register(plugin)
    @plugins << plugin
  end
  
  def academicPeriodsMenuPartialUrls
    @partialUrls = []
    @plugins.each {|plugin| @partialUrls << plugin.academicPeriodMenuPartialUrl if plugin.respond_to?('academicPeriodMenuPartialUrl')}
    
    return @partialUrls
  end
  
  def courseFormPartialUrls
    @partialUrls = []
    @plugins.each {|plugin| @partialUrls << plugin.courseFormPartialUrl if plugin.respond_to?('courseFormPartialUrl')}
    
    return @partialUrls
  end
  
  def personFormPartialUrls
    @partialUrls = []
    @plugins.each {|plugin| @partialUrls << plugin.personFormPartialUrl if plugin.respond_to?('personFormPartialUrl')}
    
    return @partialUrls
  end
  
  def personShowPartialUrls
    @partialUrls = []
    @plugins.each {|plugin| @partialUrls << plugin.personShowPartialUrl if plugin.respond_to?('personShowPartialUrl')}
    
    return @partialUrls
  end
  
  def parametersMenuPartialUrls
    @partialUrls = []
    @plugins.each {|plugin| @partialUrls << plugin.parametersMenuPartialUrl if plugin.respond_to?('parametersMenuPartialUrl')}
    
    return @partialUrls
  end
  
  def curriculumStudentMenuPartialUrls
    @partialUrls = []
    @plugins.each {|plugin| @partialUrls << plugin.curriculumStudentMenuPartialUrls if plugin.respond_to?('curriculumStudentMenuPartialUrls')}
    
    return @partialUrls
  end
  
  def clear
    @plugins = []
  end
end