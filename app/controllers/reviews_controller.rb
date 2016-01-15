class ReviewsController < ApplicationController
  def new
    @course = Course.find_by_id params[:course_id]
    @review = Review.new
  end
end
