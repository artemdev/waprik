class Public::FilmsCollectionsController < ApplicationController
	layout 'mobile'

	def show
		@collection = FilmCollection.find(params[:id])
		@films = @collection.films.page(params[:page]).per_page(10)
		@downloads = 0
		@collection.films.map {|film| downlodas =+ film.downloads if film.downloads > 0 }
	end

end
