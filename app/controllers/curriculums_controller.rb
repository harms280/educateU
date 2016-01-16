class CurriculumsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]

  def new
    @curriculum = Curriculum.new
    @languages = Language.all
  end

  def create
    @user = current_user
    @curriculum = @user.curriculums.build(curriculum_params)
    if @curriculum.save
      redirect_to @curriculum, flash: {success: "Curriculum Successfully Posted"}
    else
      render :new
    end
    # binding.pry
  end

  def show
    @curriculum = Curriculum.find_by_id params[:id]
    @posts = @curriculum.posts
  end

  private

  def curriculum_params
    params.require(:curriculum).permit(:title,:description,language_ids: [])
  end 
end
