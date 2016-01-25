class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :course_sorted, :curriculum_sorted]
  before_action :set_tabs_active

  def index
    @tab_courses = true
    @languages = Language.language_search(params[:search])
  end

  def show
    @tab_courses = true
    @courses = @language.courses.order(average_rating: :desc)
    # filtering_params(params).each do |key, value|
    #   @courses = @courses.public_send(key, value) if value.present?
    # end
    @curriculums = @language.curriculums.order('average_rating DESC')
  end

  def course_sorted
    @tab_courses = true
    @courses = @language.courses
    filtering_course_params(params).each do |key, value|
      @courses = @courses.public_send(key, value) if value.present?
    end
    @curriculums = @language.curriculums
    render :show
  end

  def curriculum_sorted
    @tab_curriculums = true
    @courses = @language.courses.order(:average_rating)
    @curriculums = @language.curriculums
    filtering_curriculum_params(params).each do |key, value|
      @curriculums = @curriculums.public_send(key, value) if value.present?
    end
    render :show
  end

  def about
  end

  private

  def filtering_course_params(params)
    params.slice(:cost, :skill_level, :rating, :organize)
  end

  def filtering_curriculum_params(params)
    params.slice(:cur_skill_level, :cur_rating, :cur_organize)
  end

  def set_language
  	@language = Language.find_by_id params[:id]
  end

  def set_tabs_active
    @tab_courses = nil
    @tab_curriculums = nil
    @tab_languages = nil
  end

end
