class Public::MusicArtistsController < ApplicationController
	layout 'mobile'

	def index
		@artists = Mp3Artist.where("first_letter = ?", params[:letter]).paginate(page: params[:page], per_page: 100)
	end

	def show
		@artist = Mp3Artist.find(params[:id])
		@albums = @artist.albums.paginate(page: params[:page], per_page: 10)
	end
	
end
