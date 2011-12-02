module Admin::ProfessorsHelper
  def active_options
    @options = []
    @options << [I18n.t('Active'), 1]
    @options << [I18n.t('Inactive'), 0]
    
    return @options
  end
end
