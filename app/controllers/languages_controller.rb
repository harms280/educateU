class LanguagesController < ApplicationController
  def index
    # @languages = Language.all()
    @languages = Language.search(params[:search])
  end

  def show
    @language = Language.find_by_id params[:id]
    @courses = @language.courses
    @curriculums = @language.curriculums
  end


end
