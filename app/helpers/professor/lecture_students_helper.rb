module Professor::LectureStudentsHelper
  def lecture_situations_options
    @lecture_situations = []
    @lecture_situations << [I18n.t('InProgress'), 0]
    LectureSituation.all.collect {|p| @lecture_situations << [ (t p.name), p.id ]}
    
    return @lecture_situations
  end
end
