class AddColumnToCurriculum < ActiveRecord::Migration
  def change
    add_column :curriculums, :skill_level, :string
  end
end
