class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :cost
      t.string :skill_level
      t.string :url
      t.string :course_created

      t.timestamps null: false
    end
  end
end
