class ChangeTitleColumnInCurriculums < ActiveRecord::Migration
  def change
  	rename_column :curriculums, :title, :name
  end
end
