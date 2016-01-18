class CurriculumsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :ensure_correct_user, only: [:edit,:update,:destroy]

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
      @languages = Language.all
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

  def ensure_correct_user
    @curriculum = Curriculum.find_by_id params[:id]
    if @curriculum.user_id != current_user.id
      redirect_to root_path, flash: {alert: "Unauthorized Action" }
    end
  end

end
