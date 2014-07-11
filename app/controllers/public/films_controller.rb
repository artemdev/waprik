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
		@latest_date = Film.latest.last.created_at
		@favourite_date = Film.latest.favourite.last.created_at
	end

	def show
		@film = Film.find(params[:id])
	end

	def news
		@films = Film.latest.favourite.limit(100).paginate(page: params[:page], per_page: 10)
	end

	def latest
		@films = Film.latest.paginate(page: params[:page], per_page: 10)
	end


end
