class Public::MusicArtistsController < ApplicationController
	layout 'mobile'

	def show
		@artist = Mp3Artist.find_by_first_letter(params[:id])
		@albums = @artist.albums.paginate(page: params[:page], per_page: 10)
	end
	
end
