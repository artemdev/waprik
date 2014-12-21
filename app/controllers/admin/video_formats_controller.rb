class Admin::VideoFormatsController < ApplicationController
  before_filter :confirm_logged_in!
  before_filter :admin?
  
	def index
		@formats = FilmFormat.all
	end

	def new
		@format = FilmFormat.new
	end

	def create
		@format = FilmFormat.new(params[:film_format])
		if @format.save
			redirect_to admin_video_formats_path, notice: 'Формат успешно добавлен'
		else
			render :new
		end
	end

	def edit
		@format = FilmFormat.find(params[:id])
	end

	def update
		@format = FilmFormat.find(params[:id])
		if @format.update_attributes(params[:film_format])
			redirect_to admin_video_formats_path, notice: 'Формат успешно обновлен'
		else
			render :edit
		end
	end

end
