class Public::CollectionGenresController < ApplicationController
	layout 'mobile'
	
	def show
		@genre = CollectionGenre.find(params[:id])
	end

end
