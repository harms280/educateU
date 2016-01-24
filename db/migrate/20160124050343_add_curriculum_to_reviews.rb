class AddCurriculumToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :curriculum, index: true, foreign_key: true
  end
end
