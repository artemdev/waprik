class Public::FilmsController < ApplicationController
	before_filter :confirm_logged_in

	def index
		@films = FilmActor.all
		render json: @films.count, status: :ok
	end
end
