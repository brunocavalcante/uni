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
    @plugins.each {|plugin| @partialUrls << plugin.personFormPartialUrl if plugin.personFormPartialUrl}
    
    return @partialUrls
  end
  
  def clear
    @plugins = []
  end
end