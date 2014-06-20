class Public::FilmsController < ApplicationController
	layout 'mobile'
	def index
		if params[:film_name]
			@films = Film.search(params[:film_name])
			@genres = FilmGenre.all
		else
			@genres = FilmGenre.all
			@films = []
		end
	end

	def show
		@film = Film.find(params[:id])
	end

	def news
		@films = Film.latest.limit(100).paginate(page: params[:page], per_page: 10)
	end

end
