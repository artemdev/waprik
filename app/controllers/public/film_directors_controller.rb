class Public::FilmDirectorsController < ApplicationController
	layout 'mobile'

	def show
		@director = FilmDirector.find(params[:id])
		@films = @director.films.paginate(page: params[:page], per_page: 10)
	end

end
