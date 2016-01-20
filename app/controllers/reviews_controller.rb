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
      @course.average_rating = calculate_average @course
      @course.save
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
    @course = @review.course
    @review.update review_params
    if @review.save
      @course.average_rating = calculate_average @course
      @course.save
      redirect_to course_path(@review.course_id), flash: {success: "Review successfully updated"}
    else
      redirect_to course_path(@review.course_id), flash: {alert: "Error: could not update"}
    end
  end

  def destroy
    @course = @review.course
    @review = Review.find_by_id params[:id]
    if @review.destroy
      avg = calculate_average @course
      @course.average_rating = avg || 0
      @course.save
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

  def calculate_average(course)
    Review.where(course_id: course.id).average(:rating)
  end

end
