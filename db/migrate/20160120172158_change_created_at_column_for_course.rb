class ChangeCreatedAtColumnForCourse < ActiveRecord::Migration
  def change
    change_column :courses, :course_created, :datetime
  end
end
