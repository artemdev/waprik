class Admin::FilmFilesController < ApplicationController
  before_filter :confirm_logged_in

  layout 'admin'

	FTP_PATH = "public/ftp/films/"

	def new
		@film = Film.find(params[:film_id])
		@files = Dir.glob(FTP_PATH + "*").sort
		@qualities = FilmQuality.all
	end

	def create
		original_path = File.expand_path(params[:film_file][:new_file])
		FFMPEGWorker.perform_async(params[:film_id], original_path, params[:film_file][:quality], 5)
		redirect_to admin_films_path
	end

	def edit
		@film = Film.find(params[:id])
		@files = Dir.glob(FTP_PATH + "*").sort
		@qualities = FilmQuality.all
	end

	def destroy
		file = FilmFile.find(params[:id])
		file.remove_real_name!
		file.destroy
		flash[:success] = "Файл удален, необходимо залить новый :)"
		redirect_to	edit_admin_film_file_path(file.film)
	end

end
