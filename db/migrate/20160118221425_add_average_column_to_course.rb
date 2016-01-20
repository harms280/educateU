class AddAverageColumnToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :average_rating, :float, :default => 0
  end
end
