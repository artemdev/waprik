class Public::FilmActorsController < ApplicationController
	layout 'mobile'

	def show
		@actor = FilmActor.find(params[:id])
		@films = @actor.films.paginate(page: params[:page], per_page: 10)
	end
end
