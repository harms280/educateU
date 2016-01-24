class SearchesController < ApplicationController
  before_action :get_languages
  before_action :get_courses
  before_action :get_curriculums
  before_action :set_tabs_active

	def index
    @tab_courses = true
		@languages = @languages.order('lower(name)')
		@courses = @courses.order(average_rating: :desc)
		@curriculums = @curriculums.order('lower(name)')
	end

  def course_sorted
    @tab_courses = true
    @languages = @languages.order(:name)
    filtering_course_params(params).each do |key, value|
      @courses = @courses.public_send(key, value) if value.present?
    end
    @curriculums = @curriculums.order(:name)
    render :index
  end

  def curriculum_sorted
    @tab_curriculums = true
    @courses = @courses.order(:average_rating)
    @languages = @languages.order(:name)
    filtering_curriculum_params(params).each do |key, value|
      @curriculums = @curriculums.public_send(key, value) if value.present?
    end
    render :index
  end

  private

  def filtering_course_params(params)
    params.slice(:cost, :skill_level, :rating, :organize)
  end

  def filtering_curriculum_params(params)
    params.slice(:cur_skill_level, :cur_rating, :cur_organize)
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

  def set_tabs_active
    @tab_courses = nil
    @tab_curriculums = nil
    @tab_languages = nil
  end

end
