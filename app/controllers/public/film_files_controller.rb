class Public::FilmFilesController < ApplicationController
	layout 'mobile'

	def show
		@file = FilmFile.find(params[:id])
		@parts = @file.film_parts
	end

	def download
		@file = FilmFile.find(params[:film_file_id])
		@file.film.downloads += 1
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
