class Public::FilmTreilersController < ApplicationController
	layout 'mobile'

	def show
		trailer = FilmTrailer.find(params[:id])
		send_file(trailer.filename.path)
	end

end
