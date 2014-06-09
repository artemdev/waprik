class Public::FilmFilesController < ApplicationController
	layout 'mobile'

	def show
		@file = FilmFile.find(params[:id])
	end

	def download
		@file = FilmFile.find(params[:film_file_id])
		@file.film.downloads += 1
		@file.film.save
		send_file(@file.real_name.path)
	end
end
