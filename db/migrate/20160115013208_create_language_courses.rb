class CreateLanguageCourses < ActiveRecord::Migration
  def change
    create_table :language_courses do |t|
      t.references :language, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
