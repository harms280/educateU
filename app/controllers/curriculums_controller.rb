class CurriculumsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :ensure_correct_user, only: [:edit,:update,:destroy]
  before_action :set_curriculum, only: [:show,:edit,:update,:destroy]
  before_action :get_languages, only: [:new,:edit,:update]

  def new
    @curriculum = Curriculum.new
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
  end

  def show
    @posts = @curriculum.posts
  end

  def edit

  end

  def update
    @curriculum.update curriculum_params
    if @curriculum.save
      redirect_to @curriculum, flash: {success: "Curriculum Successfully Updated"}
    else
      @languages = Language.all
      render :edit
    end
  end

  def destroy
    if @curriculum.destroy
      redirect_to root_path, flash: {success: "#{@curriculum.title} Successfully Deleted"}
    else
      redirect_to @curriculum, flash: {error: "There has been an error"}
    end
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

  def set_curriculum
    @curriculum = Curriculum.find_by_id params[:id]
  end

  def get_languages
    @languages = Language.all
  end

end
