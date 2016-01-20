class LanguagesController < ApplicationController
  def index
    # @languages = Language.all()
    @languages = Language.language_search(params[:search])
  end

  def show
    @language = Language.find_by_id params[:id]
    @courses = @language.courses.order(average_rating: :desc)
    # @courses = Course.where(nil)
    filtering_params(params).each do |key, value|
      @courses = @courses.public_send(key, value) if value.present?
    end
    # @courses = Product.filter(params.slice(:status, :location, :starts_with))
    @curriculums = @language.curriculums
  end

  def sort
    @language = Language.find_by_id params[:id]

  end

  private

  def filtering_params(params)
    params.slice(:cost, :skill_level, :rating)
  end


end
