class Admin::MusicArtistsController < ApplicationController
	before_filter :confirm_logged_in

  def index
  	@artists = Mp3Artist.latest.paginate(page: params[:page], per_page: 10)
  end

  def edit
  	@artist = Mp3Artist.find(params[:id])
  end

  def update
  	@artist = Mp3Artist.find(params[:id])
  	if @artist.update_attributes(params[:mp3_artist])
  		flash[:success] = "Исполнитель успешно обновлен"
  		redirect_to admin_music_artists_path
  	else
  		render :edit
  	end
  end

  def show
   	@artist = Mp3Artist.find(params[:id])
  end

  def destroy
 		track = Mp3Artist.find(params[:id]).destroy
		flash[:success] = "Исполнитель удален"
		redirect_to admin_music_artists_path
  end
end
