class CoursesController < ApplicationController
  
  def new
    @course = Course.new
    @languages = Language.all
  end

  def create
    # @user = current_user
    # binding.pry
    @course = Course.create course_params
    binding.pry
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

end
