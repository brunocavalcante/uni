module MenuHelper
  def menu_class_start
    return 'class=active' if ['admin', 'professor', 'student'].include?(first_url_parameter) && current_controller == nil
  end
  
  def menu_class_courses
    return 'class=active' if current_controller == 'courses'
  end
  
  def menu_class_professors
    return 'class=active' if current_controller == 'professors'
  end
  
  def menu_class_students
    return 'class=active' if current_controller == 'students'
  end
  
  def menu_class_academic_periods
    return 'class=active' if current_controller == 'academic_periods'
  end
  
  def menu_class_parameters
    return 'class=active' if ['parameters', 'course_categories', 'scholarities'].include? current_controller
  end
  
  def menu_class_lectures
    return 'class=active' if current_controller == 'lectures'
  end
  
  def menu_class_registration
    return 'class=active' if current_controller == 'registration'
  end
  
  def menu_class_reports
    return 'class=active' if current_controller == 'reports'
  end
  
  def first_url_parameter
    request.fullpath.split('/')[1]
  end
  
  def current_controller
    request.fullpath.split('/')[2]
  end
end