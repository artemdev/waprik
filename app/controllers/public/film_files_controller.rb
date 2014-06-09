class Public::FilmFilesController < ApplicationController
	layout 'mobile'

	def show
		@file = FilmFile.find(params[:id])
		@file.film.downloads += 1
		@file.film.save
		redirect_to(@file.real_name.path)
	end
end
