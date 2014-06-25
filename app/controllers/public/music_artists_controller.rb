class Public::MusicArtistsController < ApplicationController
	layout 'mobile'

	def index
		if params[:lang] == "eng"
			@artists = Mp3Artist.where("first_letter = ?", params[:letter]).eng.paginate(page: params[:page], per_page: 100)
			redirect_to tracks_path if @artists.empty?
		elsif params[:lang] == "rus"
			@artists = Mp3Artist.where("first_letter = ?", params[:letter]).rus.paginate(page: params[:page], per_page: 100)
			redirect_to tracks_path if @artists.empty?
		end
	end

	def show
		@artist = Mp3Artist.find(params[:id])
		@albums = @artist.albums.reverse.paginate(page: params[:page], per_page: 10)
	end
	
end
