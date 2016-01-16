class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @course = Course.find(params[:course_id])
    @review = Review.new
  end

  def create
    @course = Course.find_by_id params[:course_id]
    @review = @course.reviews.build(review_params)
    if @review.save 
      redirect_to @course, flash: {success: "Review Successfully Created"}
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title,:rating,:review_body)
  end
end
