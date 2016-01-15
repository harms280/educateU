class CurriculumsController < ApplicationController
  def new
    @curriculum = Curriculum.new
    @languages = Language.all
  end

  def create
    @user = current_user
    @curriculum = @user.curriculum.build(curriculum_params)
    if @curriculum.save
      redirect_to @curriculum, flash: {success: "Curriculum Successfully Posted"}
    else
      render :new
    end
    # binding.pry
  end

  private

  def curriculum_params
    params.require(:curriculum).permit(:title,:description)
  end 
end
