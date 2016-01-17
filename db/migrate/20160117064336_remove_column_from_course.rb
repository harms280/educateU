class RemoveColumnFromCourse < ActiveRecord::Migration
  def change
  	remove_column :courses, :course_created
  end
end
