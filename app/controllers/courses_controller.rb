class CoursesController < ApplicationController
  before_action :set_user, only: [:new, :create, :show, :edit]


  def new
    @course = Course.new
    @languages = Language.all
  end

  def create
    @course = @user.courses.build course_params
    if @course.save
      redirect_to course_path(@course), flash: {success: "#{@course.name} added!"}
    else
      render :new
    end
  end

  def show
    @course = Course.find_by_id params[:id]
  end

  private

  def course_params
    params.require(:course).permit(:name,:description,:cost,:skill_level,:url,language_ids: [])
  end

  def set_user
    @user = current_user
  end

end
