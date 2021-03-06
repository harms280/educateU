class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :prevent_multiple_reviews, only: [:new, :create]
  before_action :ensure_correct_user, only: [:edit,:update,:destroy]

  def new
    if params[:course_id]
      @parent = Course.find(params[:course_id])
    else
      @parent = Curriculum.find(params[:curriculum_id])
    end
    @review = Review.new
  end

  def create
    if params[:course_id]
      @course = Course.find_by_id params[:course_id]
      @review = @course.reviews.build(review_params)
      @review.user_id = current_user.id
      if @review.save
        @course.average_rating = calculate_course_average @course
        @course.review_count = @course.reviews.count
        @course.save
        redirect_to @course, flash: {success: "Review Successfully Created"}
      else
        @parent = Course.find(params[:course_id])
        render :new
      end
    else 
      @curriculum = Curriculum.find_by_id params[:curriculum_id]
      @review = @curriculum.reviews.build(review_params)
      @review.user_id = current_user.id
      if @review.save
        @curriculum.average_rating = calculate_curriculum_average @curriculum
        @curriculum.review_count = @curriculum.reviews.count
        @curriculum.save
        redirect_to @curriculum, flash: {success: "Review Successfully Created"}
      else
        @parent = Curriculum.find(params[:curriculum_id])
        render :new
      end
    end
  end

  def show
  end

  def edit
    @review = Review.find_by_id params[:id]
    @name = @review.course_id ? @review.course.name : @review.curriculum.name
  end

  def update
    if @review.course_id
      @course = @review.course
      @review.update review_params
      if @review.save
        @course.average_rating = calculate_course_average @course
        @course.save
        redirect_to course_path(@review.course_id), flash: {success: "Review successfully updated"}
      else
        redirect_to course_path(@review.course_id), flash: {alert: "Error: could not update"}
      end
    else
      @curriculum = @review.curriculum
      @review.update review_params
      if @review.save
        @curriculum.average_rating = calculate_curriculum_average @curriculum
        @curriculum.save
        redirect_to @curriculum, flash: {success: "Review successfully updated"}
      else
        redirect_to @curriculum, flash: {alert: "Error: could not update"}
      end
    end
  end

  def destroy
    if @review.course_id?
      @course = @review.course
      @review = Review.find_by_id params[:id]
      if @review.destroy
        avg = calculate_course_average @course
        @course.average_rating = avg || 0
        @course.review_count = @course.reviews.count
        @course.save
        redirect_to course_path(@review.course_id), flash: {success: "Review successfully deleted"}
      else
        redirect_to @course, flash: {alert: "There's been an error"}
      end
    else
      @curriculum = @review.curriculum
      @review = Review.find_by_id params[:id]
      if @review.destroy
        avg = calculate_curriculum_average @curriculum
        @curriculum.average_rating = avg || 0
        @curriculum.review_count = @curriculum.reviews.count
        @curriculum.save
        redirect_to curriculum_path(@review.curriculum_id), flash: {success: "Review successfully deleted"}
      else
        redirect_to @curriculum, flash: {alert: "There's been an error"}
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:title,:rating,:review_body)
  end

  def prevent_multiple_reviews
    if params[:course_id]
      @course = Course.find_by_id params[:course_id]
      unless current_user.reviews.where(course_id: params[:course_id]).empty?
        redirect_to @course, flash: {warning: "Already reviewed course"}
      end
    else
      @curriculum = Curriculum.find_by_id params[:curriculum_id]
      unless current_user.reviews.where(curriculum_id: params[:curriculum_id]).empty?
        redirect_to @curriculum, flash: {warning: "Already reviewed curriculum"}
      end
    end
  end

  def ensure_correct_user
    @review = Review.find_by_id params[:id]
    if @review.user_id != current_user.id
      redirect_to root_path, flash: {alert: "Unauthorized Action" }
    end
  end

  def calculate_course_average(course)
    Review.where(course_id: course.id).average(:rating)
  end

  def calculate_curriculum_average(curriculum)
    Review.where(curriculum_id: curriculum.id).average(:rating)
  end

end
