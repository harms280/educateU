class CoursesController < ApplicationController
  before_action :set_user, only: [:new, :create, :show, :edit, :update]
  before_action :authenticate_user!, only: [:new,:create,:edit,:update, :destroy]
  before_action :get_languages, only: [:new,:edit]
  before_action :ensure_correct_user, only: [:edit,:update, :destroy]
  before_action :set_course, only: [:show,:edit,:update,:destroy]


  def new
    @course = Course.new
  end

  def create
    @course = @user.courses.build course_params
    if @course.save
      redirect_to course_path(@course), flash: {success: "#{@course.name} added!"}
    else
      # redirect_to new_course_path(current_user), flash: {error: "Must fill out required fields!"}
      @languages = Language.all
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    @course.update course_params
    if @course.save
      redirect_to @course, flash: {success: "#{@course.name} updated!"}
    else
      @languages = Language.all
      render :edit
    end
  end

  def destroy
    if @course.destroy
      redirect_to root_path, flash: {success: "#{@course.name} successfully deleted"}
    else
      redirect_to @course, flash: {alert: "Not authorized"}
    end
  end

  private

  def course_params
    params.require(:course).permit(:name,:description,:cost,:skill_level,:url,:course_created, language_ids: [])
  end

  def set_user
    @user = current_user
  end

  def set_course
    @course = Course.find_by_id params[:id]
  end

  def get_languages
    @languages = Language.all
  end

  def ensure_correct_user
    @course = Course.find_by_id params[:id]
    if @course.user_id != current_user.id
      redirect_to root_path, flash: {alert: "Unauthorized Action" }
    end
  end

end
