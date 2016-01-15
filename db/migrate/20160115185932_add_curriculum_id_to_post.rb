class AddCurriculumIdToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :curriculum, index: true, foreign_key: true
  end
end
