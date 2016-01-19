class SearchesController < ApplicationController

	def index
		@languages = Language.search(params[:keyword_search]).order(:name)
		@courses = Course.search(params[:keyword_search]).order(average_rating: :desc)
		@curriculums = Curriculum.search(params[:keyword_search])
	end

end
