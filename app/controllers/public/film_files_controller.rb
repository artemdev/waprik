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
		redirect_to(action: "get_file", film_file_id: @file.id)
	end

	def get_file
		@file = FilmFile.find(params[:film_file_id])
		send_file @file.real_name.path, content_type: @file.real_name.content_type
	end

	def part
		film_file = FilmFile.find(params[:film_file_id])
		film_file.film.downloads += 1
		film_file.film.save
		redirect_to(action: "get_part", film_file_id: film_file.id)
	end

	def get_part
		part = FilmPart.find(params[:film_file_id])
		send_file part.real_name.path, content_type: part.real_name.content_type
	end

end
