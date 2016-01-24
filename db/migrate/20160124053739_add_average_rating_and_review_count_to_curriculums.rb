class AddAverageRatingAndReviewCountToCurriculums < ActiveRecord::Migration
  def change
    add_column :curriculums, :average_rating, :float, :default => 0
    add_column :curriculums, :review_count, :integer, :default => 0
  end
end
