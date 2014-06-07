class Admin::FilmFilesController < ApplicationController
	layout 'admin'
	before_filter :confirm_logged_in

	FTP_PATH = "public/ftp/films/"

	def new
		@film = Film.find(params[:film_id])
		@files = Dir.glob(FTP_PATH + "*").sort
		@formats = FilmFormat.all
	end

	def create
		original_path = File.expand_path(params[:film_file][:new_file])
		FFMPEGWorker.perform_async(params[:film_id], original_path) if original_path
		redirect_to admin_films_path
	end

end
