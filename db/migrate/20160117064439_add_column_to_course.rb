class AddColumnToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :course_created, :date
  end
end
