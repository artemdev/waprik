class Public::FilmGenresController < ApplicationController

	layout 'mobile'

	def show
		@genre = FilmGenre.find(params[:id])
		@films = @genre.films.paginate(page: params[:page], per_page: 10)
	end

end
