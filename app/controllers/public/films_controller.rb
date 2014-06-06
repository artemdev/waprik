class Public::FilmsController < ApplicationController
	before_filter :confirm_logged_in
	layout 'mobile'
	def index
		@genres = FilmGenre.all
	end

	def show
		@film = Film.find(params[:id])
	end

end
