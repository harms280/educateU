class CoursesController < ApplicationController
  before_action :set_user, only: [:new, :create, :show, :edit, :update]
  before_action :authenticate_user!, only: [:new,:create,:edit,:update, :destroy]
  before_action :get_languages, only: [:new,:edit]


  def new
    @course = Course.new
    @languages = Language.all
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
    @course = Course.find_by_id params[:id]
  end

  def edit
    @course = Course.find_by_id params[:id]
    @languages = Language.all
  end

  def update
    @course = Course.find_by_id params[:id]
    @course.update course_params
    if @course.save
      redirect_to @course, flash: {success: "#{@course.name} updated!"}
    else
      @languages = Language.all
      render :edit
    end
  end

  private

  def course_params
    params.require(:course).permit(:name,:description,:cost,:skill_level,:url,:course_created, language_ids: [])
  end

  def set_user
    @user = current_user
  end

  def get_languages
    @languages = Language.all
  end

end
