class Public::FilmFilesController < ApplicationController
	layout 'mobile'

	def show
		@file = FilmFile.find(params[:id])
		@parts = @file.film_parts
	end

	def download
		@file = FilmFile.find(params[:film_file_id])
		if @file.film.downloads.nil?
			@file.film.downloads = 0 
		else
			@file.film.downloads += 1
		end
		@file.film.save
		send_file(@file.real_name.path)
	end

	def part
		part = FilmPart.find(params[:film_file_id])
		part.film.downloads += 1
		part.film.save
		send_file(part.real_name.path)
	end

end
