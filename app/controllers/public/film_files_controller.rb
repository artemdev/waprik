class Public::FilmFilesController < ApplicationController
	layout 'mobile'

	def show
		if @file = FilmFile.find(params[:id])
		@file.film.downloads += 1
		@file.film.save(validate: false)
		link = @file.real_name.url
		redirect_to @file.film
		else
			flash[:error] = "Файл не найден"
			redirect_to :back 
		end
	end
end
