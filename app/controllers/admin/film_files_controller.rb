class Admin::FilmFilesController < ApplicationController
	layout 'admin'
	before_filter :confirm_logged_in

	FTP_PATH = "public/ftp/films/"

	def new
		@film = Film.find(params[:film_id])
		@files = Dir.glob(FTP_PATH + "*").sort
		@qualities = FilmQuality.all
	end

	def create
		original_path = File.expand_path(params[:film_file][:new_file])
		FFMPEGWorker.perform_async(params[:film_id], original_path, params[:film_file][:quality])
		redirect_to admin_films_path
	end

	def edit
		@film = Film.find(params[:film_id])
		@files = Dir.glob(FTP_PATH + "*").sort
	end

	def destroy
		file = FilmFile.find(params[:id])
		file.remove_real_name
		file.destroy
	end

end
