module Admin::CoursesHelper
  def select_course_category
    select_tag :course_category_id, 
               options_from_collection_for_select(CourseCategory.all, :id, :name, params[:course_category_id]), 
               :include_blank => true
  end
end