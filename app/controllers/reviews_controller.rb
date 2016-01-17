class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :prevent_multiple_reviews, only: [:new, :create]
  before_action :ensure_correct_user, only: [:edit,:update,:destroy]

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
    @review = Review.find_by_id params[:id]
  end

  def update
    @review.update review_params
    if @review.save
      redirect_to course_path(@review.course_id), flash: {success: "Review successfully updated"}
    else
      redirect_to course_path(@review.course_id), flash: {alert: "Error: could not update"}
    end
  end

  def destroy
    @review = Review.find_by_id params[:id]
    if @review.destroy
      redirect_to course_path(@review.course_id), flash: {success: "Review successfully deleted"}
    else
      redirect_to @course, flash: {alert: "There's been an error"}
    end
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

  def ensure_correct_user
    @review = Review.find_by_id params[:id]
    if @review.user_id != current_user.id
      redirect_to root_path, flash: {alert: "Unauthorized Action" }
    end
  end

end
