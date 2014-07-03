class Public::MusicAlbumsController < ApplicationController
	layout 'mobile'

  def show
  	@album = Mp3Album.find(params[:id])
  	@tracks = @album.tracks.paginate(page: params[:page], per_page: 10)
  end
  
end
