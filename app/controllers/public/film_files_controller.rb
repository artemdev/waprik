class Public::FilmFilesController < ApplicationController
	layout 'mobile'

	def show
		if @file = FilmFile.find(params[:id])
			@file.film.downloads += 1
			@file.film.save
			send_file(@file.real_name.path)
		else
			flash[:error] = "Файл не найден"
			redirect_to :back 
		end
	end
end
