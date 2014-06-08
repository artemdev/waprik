class Public::FilmsController < ApplicationController
	layout 'mobile'
	def index
		@genres = FilmGenre.all
	end

	def show
		@film = Film.find(params[:id])
	end

	def news
		@films = Film.latest.limit(100).paginate(page: params[:page], per_page: 10)
	end

end
