class LanguagesController < ApplicationController
  def index
    @languages = Language.all()
  end

  def show
    @language = Language.find_by_id params[:id]
    @courses = @language.courses
    @curriculums = @language.curriculums
  end
end
