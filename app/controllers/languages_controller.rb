class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :highest_rated, :lowest_rated, :most_recent, :oldest]

  def index
    # @languages = Language.all()
    @languages = Language.language_search(params[:search])
  end

  def show
    @courses = @language.courses.order(average_rating: :desc)
    filtering_params(params).each do |key, value|
      @courses = @courses.public_send(key, value) if value.present?
    end
    @curriculums = @language.curriculums
  end

  def highest_rated

  end

  def most_recent
    @courses = @language.courses.order(course_created: :desc)
    filtering_params(params).each do |key, value|
      @courses = @courses.public_send(key, value) if value.present?
    end
  end

  def oldest
  	@courses = @language.courses.order(:course_created)
  	filtering_params(params).each do |key, value|
  	  @courses = @courses.public_send(key, value) if value.present?
  	end
  end

  

  private

  def filtering_params(params)
    params.slice(:cost, :skill_level, :rating)
  end

  def set_language
  	@language = Language.find_by_id params[:id]
  end

end
