class AddLessonToLectureFile < ActiveRecord::Migration
  def change
    add_column :lecture_files, :lesson_id, :integer
  end
end
