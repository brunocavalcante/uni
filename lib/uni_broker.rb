class UniBroker
  include Singleton
  
  def initialize
    @plugins = []
  end
  
  def register(plugin)
    @plugins << plugin
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
  
  def clear
    @plugins = []
  end
end