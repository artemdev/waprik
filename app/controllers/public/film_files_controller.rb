class Public::FilmFilesController < ApplicationController
	layout 'mobile'

	def show
		@file = FilmFile.find(params[:id])
		@parts = @file.film_parts
	end

	def download
		@file = FilmFile.find(params[:film_file_id])
		@file.film.downloads += 1
		@file.save
		send_file @file.real_name.path, content_type: @file.real_name.content_type
	end

	def part
		part = FilmPart.find(params[:film_file_id])
		part.film_file.film.downloads += 1
		part.film_file.film.save
		send_file part.real_name.path, content_type: part.film_file.content_type
	end

end
