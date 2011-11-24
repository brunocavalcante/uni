module Admin::LecturesHelper
  def get_day_names_map
    day_names = {}
    i = 0
    for day in (t 'date.abbr_day_names')
      day_names[day] = i
      i += 1
    end
    return day_names.sort{|a,b| a[1] <=> b[1]}
  end
  
  def lecture_index_situations_options
    @lecture_situations = []
    @lecture_situations << [I18n.t('Pending'), 'pending']
    
    return @lecture_situations
  end
end
