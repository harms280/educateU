class AddReviewCountToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :review_count, :integer, :default => 0
  end
end
