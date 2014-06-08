class Public::FilmsController < ApplicationController
	layout 'mobile'
	def index
		@genres = FilmGenre.all
	end

	def show
		@film = Film.find(params[:id])
	end

end
