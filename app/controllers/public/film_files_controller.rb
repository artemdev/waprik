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
		send_file @file.real_name.path, content_type: @file.real_name.content_type, x_sendfile: true
	end

	def part
		film_file = FilmPart.find(params[:film_file_id])
		film_file.film.downloads += 1
		film_file.film.save
		send_file part.real_name.path, content_type: part.real_name.content_type, x_sendfile: true
	end

	def get_part
	end

end
