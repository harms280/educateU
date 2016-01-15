class LanguagesController < ApplicationController
  def index
    @languages = Language.all()
  end

  def show
    @language = Language.find_by_id params[:id]
    @courses = LanguageCourse.where(language_id: params[:id])
    binding.pry
  end
end
