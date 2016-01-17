class SearchesController < ApplicationController

	def index
		@languages = Language.search(params[:keyword_search])
		@courses = Course.search(params[:keyword_search])
		@curriculums = Curriculum.search(params[:keyword_search])
	end

end
