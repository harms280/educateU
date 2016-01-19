class LanguagesController < ApplicationController
  def index
    # @languages = Language.all()
    @languages = Language.language_search(params[:search])
  end

  def show
    @language = Language.find_by_id params[:id]
    @courses = @language.courses.order(average_rating: :desc)
    @curriculums = @language.curriculums
  end

  def sort
    @language = Language.find_by_id params[:id]

  end


end
