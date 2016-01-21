class SearchesController < ApplicationController
  before_action :get_languages
  before_action :get_courses
  before_action :get_curriculums

	def index
		@languages.order(:name)
		@courses.order(average_rating: :desc)
		@curriculums.order(:name)
	end

  def course_sorted
    # @courses = @language.courses
    filtering_course_params(params).each do |key, value|
      @courses = @courses.public_send(key, value) if value.present?
    end
    # @curriculums = @language.curriculums
    render :index
  end

  private

  def filtering_course_params(params)
    params.slice(:cost, :skill_level, :rating, :organize)
  end

  def get_languages
    @languages = Language.search(params[:keyword_search])
  end

  def get_courses
    @courses = Course.search(params[:keyword_search])
  end

  def get_curriculums
    @curriculums = Curriculum.search(params[:keyword_search])
  end

end
