class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :prevent_multiple_reviews, only: [:new, :create]

  def new
    @course = Course.find(params[:course_id])
    @review = Review.new
  end

  def create
    @course = Course.find_by_id params[:course_id]
    @review = @course.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save 
      redirect_to @course, flash: {success: "Review Successfully Created"}
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:title,:rating,:review_body)
  end

  def prevent_multiple_reviews
    @course = Course.find_by_id params[:course_id]
    unless current_user.reviews.where(course_id: params[:course_id]).empty?
      redirect_to @course, flash: {warning: "Already reviewed course"}
    end
  end
end
