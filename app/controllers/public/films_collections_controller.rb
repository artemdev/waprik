class Public::FilmsCollectionsController < ApplicationController
	layout 'mobile'

	def show
		@collection = FilmCollection.find(params[:id])
		@films = @collection.films.page(params[:page]).per_page(10)
		@downloads = 0
		@collection.films.each do |film|
			@downloads += film.download
		end
	end

end
